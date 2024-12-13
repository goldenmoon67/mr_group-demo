import 'package:deeplink_project_for_mr_group/data/models/coupon/coupon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

class QuicActions extends StatelessWidget {
  final List<Coupon>? coupons;
  final String? referralLink;
  final void Function(String code) onTapUseCoupon;
  const QuicActions(
      {super.key,
      required this.coupons,
      required this.referralLink,
      required this.onTapUseCoupon});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Quick Actions",
            style: theme.textTheme.headlineMedium?.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _actionItem(
                  theme,
                  "My Refferal Link",
                  referralLink != null
                      ? Icon(Icons.link,
                          size: 32, color: theme.colorScheme.onPrimary)
                      : CircularProgressIndicator(),
                  referralLink != null
                      ? () {
                          showsLinkModal(context);
                        }
                      : null,
                ),
                _actionItem(
                  theme,
                  "My Coupons",
                  coupons != null
                      ? Icon(Icons.card_giftcard,
                          size: 32, color: theme.colorScheme.onPrimary)
                      : CircularProgressIndicator(),
                  coupons != null
                      ? () {
                          _showCouponsModal(context);
                        }
                      : null,
                ),
                _actionItem(
                  theme,
                  "Use Coupon",
                  coupons != null
                      ? Icon(Icons.celebration_rounded,
                          size: 32, color: theme.colorScheme.onPrimary)
                      : CircularProgressIndicator(),
                  coupons != null
                      ? () {
                          _showUseCouponModal(context);
                        }
                      : null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> showsLinkModal(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext modalContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Row(
            children: [
              Icon(Icons.share, color: Theme.of(context).primaryColor),
              const SizedBox(width: 8),
              const Text(
                "Your Referral Link",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          content: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: TextEditingController(text: referralLink),
                  readOnly: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.copy),
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: referralLink!));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text("Link copied to clipboard")),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
          actions: [
            ElevatedButton.icon(
              onPressed: () {
                Share.share(referralLink!,
                    subject: "Check out this referral link!");
              },
              icon: const Icon(Icons.share),
              label: const Text("Share"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
            ),
          ],
        );
      },
    );
  }

  Column _actionItem(
      ThemeData theme, String title, Widget icon, void Function()? onTap) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(20),
          ),
          child: icon,
        ),
        const SizedBox(height: 8),
        Text(title, style: theme.textTheme.bodyMedium),
      ],
    );
  }

  void _showCouponsModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      isScrollControlled: true,
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.5,
          minChildSize: 0.4,
          maxChildSize: 0.8,
          builder: (_, scrollController) {
            return Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "My Coupons",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 16),
                  if (coupons == null || coupons!.isEmpty)
                    Expanded(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.sentiment_dissatisfied,
                              size: 48,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              "No coupons available",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    )
                  else
                    Expanded(
                      child: ListView.builder(
                        controller: scrollController,
                        itemCount: coupons!.length,
                        itemBuilder: (context, index) {
                          final couponTitle = coupons![index].code;
                          final isUsed = coupons![index].isUsed;
                          return ListTile(
                            leading: Icon(Icons.card_giftcard_rounded,
                                color: Theme.of(context).primaryColor),
                            title: Text(couponTitle),
                            trailing: IconButton(
                              icon:
                                  isUsed ? Icon(Icons.check) : Icon(Icons.copy),
                              onPressed: isUsed
                                  ? null
                                  : () {
                                      Clipboard.setData(
                                          ClipboardData(text: couponTitle));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                              "Copied $couponTitle to clipboard"),
                                          duration: const Duration(seconds: 2),
                                        ),
                                      );
                                    },
                            ),
                          );
                        },
                      ),
                    ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  _showUseCouponModal(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();

    return showDialog(
      context: context,
      builder: (BuildContext modalContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Row(
            children: [
              Icon(Icons.share, color: Theme.of(context).primaryColor),
              const SizedBox(width: 8),
              const Text(
                "Use Coupon",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          content: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: textEditingController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.paste),
                      onPressed: () async {
                        ClipboardData? clipboardData =
                            await Clipboard.getData('text/plain');
                        if (clipboardData?.text != null) {
                          textEditingController.text = clipboardData!.text!;
                        }
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
          actions: [
            ElevatedButton.icon(
              onPressed: () {
                if (textEditingController.text.isNotEmpty) {
                  onTapUseCoupon(textEditingController.text);
                }
              },
              label: const Text("Use"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
            ),
          ],
        );
      },
    );
  }
}
