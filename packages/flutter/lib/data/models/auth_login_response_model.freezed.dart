// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_login_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthUserModel {

 int get id; String get username;
/// Create a copy of AuthUserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthUserModelCopyWith<AuthUserModel> get copyWith => _$AuthUserModelCopyWithImpl<AuthUserModel>(this as AuthUserModel, _$identity);

  /// Serializes this AuthUserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthUserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username);

@override
String toString() {
  return 'AuthUserModel(id: $id, username: $username)';
}


}

/// @nodoc
abstract mixin class $AuthUserModelCopyWith<$Res>  {
  factory $AuthUserModelCopyWith(AuthUserModel value, $Res Function(AuthUserModel) _then) = _$AuthUserModelCopyWithImpl;
@useResult
$Res call({
 int id, String username
});




}
/// @nodoc
class _$AuthUserModelCopyWithImpl<$Res>
    implements $AuthUserModelCopyWith<$Res> {
  _$AuthUserModelCopyWithImpl(this._self, this._then);

  final AuthUserModel _self;
  final $Res Function(AuthUserModel) _then;

/// Create a copy of AuthUserModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? username = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthUserModel].
extension AuthUserModelPatterns on AuthUserModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthUserModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthUserModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthUserModel value)  $default,){
final _that = this;
switch (_that) {
case _AuthUserModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthUserModel value)?  $default,){
final _that = this;
switch (_that) {
case _AuthUserModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String username)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthUserModel() when $default != null:
return $default(_that.id,_that.username);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String username)  $default,) {final _that = this;
switch (_that) {
case _AuthUserModel():
return $default(_that.id,_that.username);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String username)?  $default,) {final _that = this;
switch (_that) {
case _AuthUserModel() when $default != null:
return $default(_that.id,_that.username);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthUserModel implements AuthUserModel {
  const _AuthUserModel({required this.id, required this.username});
  factory _AuthUserModel.fromJson(Map<String, dynamic> json) => _$AuthUserModelFromJson(json);

@override final  int id;
@override final  String username;

/// Create a copy of AuthUserModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthUserModelCopyWith<_AuthUserModel> get copyWith => __$AuthUserModelCopyWithImpl<_AuthUserModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthUserModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthUserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username);

@override
String toString() {
  return 'AuthUserModel(id: $id, username: $username)';
}


}

/// @nodoc
abstract mixin class _$AuthUserModelCopyWith<$Res> implements $AuthUserModelCopyWith<$Res> {
  factory _$AuthUserModelCopyWith(_AuthUserModel value, $Res Function(_AuthUserModel) _then) = __$AuthUserModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String username
});




}
/// @nodoc
class __$AuthUserModelCopyWithImpl<$Res>
    implements _$AuthUserModelCopyWith<$Res> {
  __$AuthUserModelCopyWithImpl(this._self, this._then);

  final _AuthUserModel _self;
  final $Res Function(_AuthUserModel) _then;

/// Create a copy of AuthUserModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? username = null,}) {
  return _then(_AuthUserModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$AuthLoginResponseModel {

@JsonKey(name: 'access_token') String get accessToken; AuthUserModel? get user;
/// Create a copy of AuthLoginResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthLoginResponseModelCopyWith<AuthLoginResponseModel> get copyWith => _$AuthLoginResponseModelCopyWithImpl<AuthLoginResponseModel>(this as AuthLoginResponseModel, _$identity);

  /// Serializes this AuthLoginResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthLoginResponseModel&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,user);

@override
String toString() {
  return 'AuthLoginResponseModel(accessToken: $accessToken, user: $user)';
}


}

/// @nodoc
abstract mixin class $AuthLoginResponseModelCopyWith<$Res>  {
  factory $AuthLoginResponseModelCopyWith(AuthLoginResponseModel value, $Res Function(AuthLoginResponseModel) _then) = _$AuthLoginResponseModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'access_token') String accessToken, AuthUserModel? user
});


$AuthUserModelCopyWith<$Res>? get user;

}
/// @nodoc
class _$AuthLoginResponseModelCopyWithImpl<$Res>
    implements $AuthLoginResponseModelCopyWith<$Res> {
  _$AuthLoginResponseModelCopyWithImpl(this._self, this._then);

  final AuthLoginResponseModel _self;
  final $Res Function(AuthLoginResponseModel) _then;

/// Create a copy of AuthLoginResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accessToken = null,Object? user = freezed,}) {
  return _then(_self.copyWith(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as AuthUserModel?,
  ));
}
/// Create a copy of AuthLoginResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthUserModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $AuthUserModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [AuthLoginResponseModel].
extension AuthLoginResponseModelPatterns on AuthLoginResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthLoginResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthLoginResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthLoginResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _AuthLoginResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthLoginResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _AuthLoginResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'access_token')  String accessToken,  AuthUserModel? user)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthLoginResponseModel() when $default != null:
return $default(_that.accessToken,_that.user);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'access_token')  String accessToken,  AuthUserModel? user)  $default,) {final _that = this;
switch (_that) {
case _AuthLoginResponseModel():
return $default(_that.accessToken,_that.user);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'access_token')  String accessToken,  AuthUserModel? user)?  $default,) {final _that = this;
switch (_that) {
case _AuthLoginResponseModel() when $default != null:
return $default(_that.accessToken,_that.user);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthLoginResponseModel implements AuthLoginResponseModel {
  const _AuthLoginResponseModel({@JsonKey(name: 'access_token') required this.accessToken, this.user});
  factory _AuthLoginResponseModel.fromJson(Map<String, dynamic> json) => _$AuthLoginResponseModelFromJson(json);

@override@JsonKey(name: 'access_token') final  String accessToken;
@override final  AuthUserModel? user;

/// Create a copy of AuthLoginResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthLoginResponseModelCopyWith<_AuthLoginResponseModel> get copyWith => __$AuthLoginResponseModelCopyWithImpl<_AuthLoginResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthLoginResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthLoginResponseModel&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,user);

@override
String toString() {
  return 'AuthLoginResponseModel(accessToken: $accessToken, user: $user)';
}


}

/// @nodoc
abstract mixin class _$AuthLoginResponseModelCopyWith<$Res> implements $AuthLoginResponseModelCopyWith<$Res> {
  factory _$AuthLoginResponseModelCopyWith(_AuthLoginResponseModel value, $Res Function(_AuthLoginResponseModel) _then) = __$AuthLoginResponseModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'access_token') String accessToken, AuthUserModel? user
});


@override $AuthUserModelCopyWith<$Res>? get user;

}
/// @nodoc
class __$AuthLoginResponseModelCopyWithImpl<$Res>
    implements _$AuthLoginResponseModelCopyWith<$Res> {
  __$AuthLoginResponseModelCopyWithImpl(this._self, this._then);

  final _AuthLoginResponseModel _self;
  final $Res Function(_AuthLoginResponseModel) _then;

/// Create a copy of AuthLoginResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accessToken = null,Object? user = freezed,}) {
  return _then(_AuthLoginResponseModel(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as AuthUserModel?,
  ));
}

/// Create a copy of AuthLoginResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthUserModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $AuthUserModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
