// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contact_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ContactDetailEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContactDetailEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ContactDetailEvent()';
}


}

/// @nodoc
class $ContactDetailEventCopyWith<$Res>  {
$ContactDetailEventCopyWith(ContactDetailEvent _, $Res Function(ContactDetailEvent) __);
}


/// Adds pattern-matching-related methods to [ContactDetailEvent].
extension ContactDetailEventPatterns on ContactDetailEvent {
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


class _Started implements ContactDetailEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ContactDetailEvent.started()';
}


}




/// @nodoc
mixin _$ContactDetailState {

 ContactDetailStatus get status; ContactEntity? get contact; String? get errorMessage;
/// Create a copy of ContactDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContactDetailStateCopyWith<ContactDetailState> get copyWith => _$ContactDetailStateCopyWithImpl<ContactDetailState>(this as ContactDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContactDetailState&&(identical(other.status, status) || other.status == status)&&(identical(other.contact, contact) || other.contact == contact)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,contact,errorMessage);

@override
String toString() {
  return 'ContactDetailState(status: $status, contact: $contact, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $ContactDetailStateCopyWith<$Res>  {
  factory $ContactDetailStateCopyWith(ContactDetailState value, $Res Function(ContactDetailState) _then) = _$ContactDetailStateCopyWithImpl;
@useResult
$Res call({
 ContactDetailStatus status, ContactEntity? contact, String? errorMessage
});




}
/// @nodoc
class _$ContactDetailStateCopyWithImpl<$Res>
    implements $ContactDetailStateCopyWith<$Res> {
  _$ContactDetailStateCopyWithImpl(this._self, this._then);

  final ContactDetailState _self;
  final $Res Function(ContactDetailState) _then;

/// Create a copy of ContactDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? contact = freezed,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ContactDetailStatus,contact: freezed == contact ? _self.contact : contact // ignore: cast_nullable_to_non_nullable
as ContactEntity?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ContactDetailState].
extension ContactDetailStatePatterns on ContactDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContactDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContactDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContactDetailState value)  $default,){
final _that = this;
switch (_that) {
case _ContactDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContactDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _ContactDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ContactDetailStatus status,  ContactEntity? contact,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContactDetailState() when $default != null:
return $default(_that.status,_that.contact,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ContactDetailStatus status,  ContactEntity? contact,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _ContactDetailState():
return $default(_that.status,_that.contact,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ContactDetailStatus status,  ContactEntity? contact,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _ContactDetailState() when $default != null:
return $default(_that.status,_that.contact,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _ContactDetailState implements ContactDetailState {
  const _ContactDetailState({this.status = ContactDetailStatus.initial, this.contact, this.errorMessage});
  

@override@JsonKey() final  ContactDetailStatus status;
@override final  ContactEntity? contact;
@override final  String? errorMessage;

/// Create a copy of ContactDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContactDetailStateCopyWith<_ContactDetailState> get copyWith => __$ContactDetailStateCopyWithImpl<_ContactDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContactDetailState&&(identical(other.status, status) || other.status == status)&&(identical(other.contact, contact) || other.contact == contact)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,contact,errorMessage);

@override
String toString() {
  return 'ContactDetailState(status: $status, contact: $contact, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$ContactDetailStateCopyWith<$Res> implements $ContactDetailStateCopyWith<$Res> {
  factory _$ContactDetailStateCopyWith(_ContactDetailState value, $Res Function(_ContactDetailState) _then) = __$ContactDetailStateCopyWithImpl;
@override @useResult
$Res call({
 ContactDetailStatus status, ContactEntity? contact, String? errorMessage
});




}
/// @nodoc
class __$ContactDetailStateCopyWithImpl<$Res>
    implements _$ContactDetailStateCopyWith<$Res> {
  __$ContactDetailStateCopyWithImpl(this._self, this._then);

  final _ContactDetailState _self;
  final $Res Function(_ContactDetailState) _then;

/// Create a copy of ContactDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? contact = freezed,Object? errorMessage = freezed,}) {
  return _then(_ContactDetailState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ContactDetailStatus,contact: freezed == contact ? _self.contact : contact // ignore: cast_nullable_to_non_nullable
as ContactEntity?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
