// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get referralId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get balance => throw _privateConstructorUsedError;
  String get referralLink => throw _privateConstructorUsedError;
  List<Coupon> get coupons => throw _privateConstructorUsedError;

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      String email,
      String referralId,
      String name,
      double balance,
      String referralLink,
      List<Coupon> coupons});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? referralId = null,
    Object? name = null,
    Object? balance = null,
    Object? referralLink = null,
    Object? coupons = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      referralId: null == referralId
          ? _value.referralId
          : referralId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      referralLink: null == referralLink
          ? _value.referralLink
          : referralLink // ignore: cast_nullable_to_non_nullable
              as String,
      coupons: null == coupons
          ? _value.coupons
          : coupons // ignore: cast_nullable_to_non_nullable
              as List<Coupon>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      String email,
      String referralId,
      String name,
      double balance,
      String referralLink,
      List<Coupon> coupons});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? referralId = null,
    Object? name = null,
    Object? balance = null,
    Object? referralLink = null,
    Object? coupons = null,
  }) {
    return _then(_$UserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      referralId: null == referralId
          ? _value.referralId
          : referralId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      referralLink: null == referralLink
          ? _value.referralLink
          : referralLink // ignore: cast_nullable_to_non_nullable
              as String,
      coupons: null == coupons
          ? _value._coupons
          : coupons // ignore: cast_nullable_to_non_nullable
              as List<Coupon>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl(
      {@JsonKey(name: "_id") required this.id,
      required this.email,
      required this.referralId,
      required this.name,
      required this.balance,
      required this.referralLink,
      final List<Coupon> coupons = const []})
      : _coupons = coupons;

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  final String email;
  @override
  final String referralId;
  @override
  final String name;
  @override
  final double balance;
  @override
  final String referralLink;
  final List<Coupon> _coupons;
  @override
  @JsonKey()
  List<Coupon> get coupons {
    if (_coupons is EqualUnmodifiableListView) return _coupons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_coupons);
  }

  @override
  String toString() {
    return 'User(id: $id, email: $email, referralId: $referralId, name: $name, balance: $balance, referralLink: $referralLink, coupons: $coupons)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.referralId, referralId) ||
                other.referralId == referralId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.referralLink, referralLink) ||
                other.referralLink == referralLink) &&
            const DeepCollectionEquality().equals(other._coupons, _coupons));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, email, referralId, name,
      balance, referralLink, const DeepCollectionEquality().hash(_coupons));

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {@JsonKey(name: "_id") required final String id,
      required final String email,
      required final String referralId,
      required final String name,
      required final double balance,
      required final String referralLink,
      final List<Coupon> coupons}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  String get email;
  @override
  String get referralId;
  @override
  String get name;
  @override
  double get balance;
  @override
  String get referralLink;
  @override
  List<Coupon> get coupons;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
