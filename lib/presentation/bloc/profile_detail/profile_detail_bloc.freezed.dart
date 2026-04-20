// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileDetailEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileDetailEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileDetailEvent()';
}


}

/// @nodoc
class $ProfileDetailEventCopyWith<$Res>  {
$ProfileDetailEventCopyWith(ProfileDetailEvent _, $Res Function(ProfileDetailEvent) __);
}


/// Adds pattern-matching-related methods to [ProfileDetailEvent].
extension ProfileDetailEventPatterns on ProfileDetailEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,}) {final _that = this;
switch (_that) {
case _Started():
return started();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _:
  return null;

}
}

}

/// @nodoc


class _Started implements ProfileDetailEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileDetailEvent.started()';
}


}




/// @nodoc
mixin _$ProfileDetailState {

 ProfileDetailStatus get status; ProfileEntity? get profile; String? get errorMessage;
/// Create a copy of ProfileDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileDetailStateCopyWith<ProfileDetailState> get copyWith => _$ProfileDetailStateCopyWithImpl<ProfileDetailState>(this as ProfileDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileDetailState&&(identical(other.status, status) || other.status == status)&&(identical(other.profile, profile) || other.profile == profile)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,profile,errorMessage);

@override
String toString() {
  return 'ProfileDetailState(status: $status, profile: $profile, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $ProfileDetailStateCopyWith<$Res>  {
  factory $ProfileDetailStateCopyWith(ProfileDetailState value, $Res Function(ProfileDetailState) _then) = _$ProfileDetailStateCopyWithImpl;
@useResult
$Res call({
 ProfileDetailStatus status, ProfileEntity? profile, String? errorMessage
});




}
/// @nodoc
class _$ProfileDetailStateCopyWithImpl<$Res>
    implements $ProfileDetailStateCopyWith<$Res> {
  _$ProfileDetailStateCopyWithImpl(this._self, this._then);

  final ProfileDetailState _self;
  final $Res Function(ProfileDetailState) _then;

/// Create a copy of ProfileDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? profile = freezed,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProfileDetailStatus,profile: freezed == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as ProfileEntity?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileDetailState].
extension ProfileDetailStatePatterns on ProfileDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileDetailState value)  $default,){
final _that = this;
switch (_that) {
case _ProfileDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ProfileDetailStatus status,  ProfileEntity? profile,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileDetailState() when $default != null:
return $default(_that.status,_that.profile,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ProfileDetailStatus status,  ProfileEntity? profile,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _ProfileDetailState():
return $default(_that.status,_that.profile,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ProfileDetailStatus status,  ProfileEntity? profile,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _ProfileDetailState() when $default != null:
return $default(_that.status,_that.profile,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _ProfileDetailState implements ProfileDetailState {
  const _ProfileDetailState({this.status = ProfileDetailStatus.initial, this.profile, this.errorMessage});
  

@override@JsonKey() final  ProfileDetailStatus status;
@override final  ProfileEntity? profile;
@override final  String? errorMessage;

/// Create a copy of ProfileDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileDetailStateCopyWith<_ProfileDetailState> get copyWith => __$ProfileDetailStateCopyWithImpl<_ProfileDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileDetailState&&(identical(other.status, status) || other.status == status)&&(identical(other.profile, profile) || other.profile == profile)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,profile,errorMessage);

@override
String toString() {
  return 'ProfileDetailState(status: $status, profile: $profile, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$ProfileDetailStateCopyWith<$Res> implements $ProfileDetailStateCopyWith<$Res> {
  factory _$ProfileDetailStateCopyWith(_ProfileDetailState value, $Res Function(_ProfileDetailState) _then) = __$ProfileDetailStateCopyWithImpl;
@override @useResult
$Res call({
 ProfileDetailStatus status, ProfileEntity? profile, String? errorMessage
});




}
/// @nodoc
class __$ProfileDetailStateCopyWithImpl<$Res>
    implements _$ProfileDetailStateCopyWith<$Res> {
  __$ProfileDetailStateCopyWithImpl(this._self, this._then);

  final _ProfileDetailState _self;
  final $Res Function(_ProfileDetailState) _then;

/// Create a copy of ProfileDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? profile = freezed,Object? errorMessage = freezed,}) {
  return _then(_ProfileDetailState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProfileDetailStatus,profile: freezed == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as ProfileEntity?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
