import 'package:deeplink_project_for_mr_group/bloc/product/product_bloc.dart';
import 'package:deeplink_project_for_mr_group/core/utils/token_manager.dart';
import 'package:deeplink_project_for_mr_group/data/models/coupon/coupon.dart';
import 'package:deeplink_project_for_mr_group/data/models/user/user.dart';
import 'package:deeplink_project_for_mr_group/ui/screens/login_screen.dart';
import 'package:deeplink_project_for_mr_group/ui/screens/product_screen.dart';
import 'package:deeplink_project_for_mr_group/ui/widgets/mock/random_icon_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:deeplink_project_for_mr_group/bloc/user/user_bloc.dart';
import 'package:deeplink_project_for_mr_group/locator.dart';
import 'package:deeplink_project_for_mr_group/ui/widgets/home/appbar.dart';
import 'package:deeplink_project_for_mr_group/ui/widgets/home/product_item.dart';
import 'package:deeplink_project_for_mr_group/ui/widgets/home/quick_actions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<UserBloc>()..add(StartUser())),
        BlocProvider(create: (_) => getIt<ProductBloc>()..add(StartProduct())),
      ],
      child: const HomeScreenContent(),
    );
  }
}

class HomeScreenContent extends StatefulWidget {
  const HomeScreenContent({super.key});

  @override
  State<HomeScreenContent> createState() => _HomeScreenContentState();
}

class _HomeScreenContentState extends State<HomeScreenContent> {
  List<Coupon>? coupons;
  String? referralLink;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 220,
              collapsedHeight: 60,
              pinned: true,
              flexibleSpace: UserAppBar(
                onStateLoaded: (user, link) {
                  if (coupons != user.coupons || referralLink != link) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      if (mounted) {
                        setState(() {
                          coupons = user.coupons;
                          referralLink = link;
                        });
                      }
                    });
                  }
                },
              ),
            ),
            SliverToBoxAdapter(
                child: QuicActions(
              onTapUseCoupon: (code) {
                Navigator.pop(context);
                context.read<UserBloc>().add(UseCoupon(couponCode: code));
              },
              coupons: coupons,
              referralLink: referralLink,
            )),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  'Products',
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state.status == ProductStatus.loading) {
                  return const SliverToBoxAdapter(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else if (state.status == ProductStatus.loaded) {
                  final products = state.products;
                  if (products!.isEmpty) {
                    return const SliverToBoxAdapter(
                      child: Center(child: Text('No products found')),
                    );
                  }
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final product = products[index];
                        var mockIcon = RandomIconGenerator.getRandomIcon();
                        return ProductItem(
                          product: product,
                          mockIcon: mockIcon,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BlocProvider.value(
                                  value: getIt<ProductBloc>(),
                                  child: ProductDetailScreen(
                                    product: product,
                                    icon: mockIcon,
                                  ),
                                ),
                              ),
                            ).then((_) {
                              _refresh();
                            });
                          },
                        );
                      },
                      childCount: products.length,
                    ),
                  );
                } else if (state.status == ProductStatus.error) {
                  return const SliverToBoxAdapter(
                    child: Center(
                      child: Text(
                        'Error loading products',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  );
                }
                return const SliverToBoxAdapter(child: SizedBox());
              },
            ),
          ],
        ),
      ),
    );
  }

  void _refresh() {
    context.read<UserBloc>().add(RefreshUser());
  }
}

class UserAppBar extends StatefulWidget {
  final void Function(User user, String link) onStateLoaded;
  const UserAppBar({super.key, required this.onStateLoaded});

  @override
  State<UserAppBar> createState() => _UserAppBarState();
}

class _UserAppBarState extends State<UserAppBar> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state.status == UserStatus.loading) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.white),
          );
        } else if (state.status == UserStatus.loaded) {
          final user = state.user!;
          widget.onStateLoaded(user, user.referralLink);
          return HomeSliverAppbarContent(
            balance: user.balance,
            userName: user.name,
            onPressed: () {
              _logOut();
            },
          );
        } else {
          return const Center(
            child: Text(
              "Error loading user data",
              style: TextStyle(color: Colors.white),
            ),
          );
        }
      },
    );
  }

  Future<void> _logOut() async {
    var tokenManager = getIt<TokenManager>();
    await tokenManager.clearTokens();
    _gotoLogin();
  }

  void _gotoLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }
}
