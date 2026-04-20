// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_login_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthLoginRequestModel {

 String get username; String get password;
/// Create a copy of AuthLoginRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthLoginRequestModelCopyWith<AuthLoginRequestModel> get copyWith => _$AuthLoginRequestModelCopyWithImpl<AuthLoginRequestModel>(this as AuthLoginRequestModel, _$identity);

  /// Serializes this AuthLoginRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthLoginRequestModel&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,username,password);

@override
String toString() {
  return 'AuthLoginRequestModel(username: $username, password: $password)';
}


}

/// @nodoc
abstract mixin class $AuthLoginRequestModelCopyWith<$Res>  {
  factory $AuthLoginRequestModelCopyWith(AuthLoginRequestModel value, $Res Function(AuthLoginRequestModel) _then) = _$AuthLoginRequestModelCopyWithImpl;
@useResult
$Res call({
 String username, String password
});




}
/// @nodoc
class _$AuthLoginRequestModelCopyWithImpl<$Res>
    implements $AuthLoginRequestModelCopyWith<$Res> {
  _$AuthLoginRequestModelCopyWithImpl(this._self, this._then);

  final AuthLoginRequestModel _self;
  final $Res Function(AuthLoginRequestModel) _then;

/// Create a copy of AuthLoginRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? username = null,Object? password = null,}) {
  return _then(_self.copyWith(
username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthLoginRequestModel].
extension AuthLoginRequestModelPatterns on AuthLoginRequestModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthLoginRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthLoginRequestModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthLoginRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _AuthLoginRequestModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthLoginRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _AuthLoginRequestModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String username,  String password)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthLoginRequestModel() when $default != null:
return $default(_that.username,_that.password);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String username,  String password)  $default,) {final _that = this;
switch (_that) {
case _AuthLoginRequestModel():
return $default(_that.username,_that.password);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String username,  String password)?  $default,) {final _that = this;
switch (_that) {
case _AuthLoginRequestModel() when $default != null:
return $default(_that.username,_that.password);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthLoginRequestModel implements AuthLoginRequestModel {
  const _AuthLoginRequestModel({required this.username, required this.password});
  factory _AuthLoginRequestModel.fromJson(Map<String, dynamic> json) => _$AuthLoginRequestModelFromJson(json);

@override final  String username;
@override final  String password;

/// Create a copy of AuthLoginRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthLoginRequestModelCopyWith<_AuthLoginRequestModel> get copyWith => __$AuthLoginRequestModelCopyWithImpl<_AuthLoginRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthLoginRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthLoginRequestModel&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,username,password);

@override
String toString() {
  return 'AuthLoginRequestModel(username: $username, password: $password)';
}


}

/// @nodoc
abstract mixin class _$AuthLoginRequestModelCopyWith<$Res> implements $AuthLoginRequestModelCopyWith<$Res> {
  factory _$AuthLoginRequestModelCopyWith(_AuthLoginRequestModel value, $Res Function(_AuthLoginRequestModel) _then) = __$AuthLoginRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String username, String password
});




}
/// @nodoc
class __$AuthLoginRequestModelCopyWithImpl<$Res>
    implements _$AuthLoginRequestModelCopyWith<$Res> {
  __$AuthLoginRequestModelCopyWithImpl(this._self, this._then);

  final _AuthLoginRequestModel _self;
  final $Res Function(_AuthLoginRequestModel) _then;

/// Create a copy of AuthLoginRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? username = null,Object? password = null,}) {
  return _then(_AuthLoginRequestModel(
username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
