// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contacts_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ContactsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContactsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ContactsEvent()';
}


}

/// @nodoc
class $ContactsEventCopyWith<$Res>  {
$ContactsEventCopyWith(ContactsEvent _, $Res Function(ContactsEvent) __);
}


/// Adds pattern-matching-related methods to [ContactsEvent].
extension ContactsEventPatterns on ContactsEvent {
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


class _Started implements ContactsEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ContactsEvent.started()';
}


}




/// @nodoc
mixin _$ContactsState {

 ContactsStatus get status; List<ContactEntity> get contacts; String? get errorMessage;
/// Create a copy of ContactsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContactsStateCopyWith<ContactsState> get copyWith => _$ContactsStateCopyWithImpl<ContactsState>(this as ContactsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContactsState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.contacts, contacts)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(contacts),errorMessage);

@override
String toString() {
  return 'ContactsState(status: $status, contacts: $contacts, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $ContactsStateCopyWith<$Res>  {
  factory $ContactsStateCopyWith(ContactsState value, $Res Function(ContactsState) _then) = _$ContactsStateCopyWithImpl;
@useResult
$Res call({
 ContactsStatus status, List<ContactEntity> contacts, String? errorMessage
});




}
/// @nodoc
class _$ContactsStateCopyWithImpl<$Res>
    implements $ContactsStateCopyWith<$Res> {
  _$ContactsStateCopyWithImpl(this._self, this._then);

  final ContactsState _self;
  final $Res Function(ContactsState) _then;

/// Create a copy of ContactsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? contacts = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ContactsStatus,contacts: null == contacts ? _self.contacts : contacts // ignore: cast_nullable_to_non_nullable
as List<ContactEntity>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ContactsState].
extension ContactsStatePatterns on ContactsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContactsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContactsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContactsState value)  $default,){
final _that = this;
switch (_that) {
case _ContactsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContactsState value)?  $default,){
final _that = this;
switch (_that) {
case _ContactsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ContactsStatus status,  List<ContactEntity> contacts,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContactsState() when $default != null:
return $default(_that.status,_that.contacts,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ContactsStatus status,  List<ContactEntity> contacts,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _ContactsState():
return $default(_that.status,_that.contacts,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ContactsStatus status,  List<ContactEntity> contacts,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _ContactsState() when $default != null:
return $default(_that.status,_that.contacts,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _ContactsState implements ContactsState {
  const _ContactsState({this.status = ContactsStatus.initial, final  List<ContactEntity> contacts = const <ContactEntity>[], this.errorMessage}): _contacts = contacts;
  

@override@JsonKey() final  ContactsStatus status;
 final  List<ContactEntity> _contacts;
@override@JsonKey() List<ContactEntity> get contacts {
  if (_contacts is EqualUnmodifiableListView) return _contacts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_contacts);
}

@override final  String? errorMessage;

/// Create a copy of ContactsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContactsStateCopyWith<_ContactsState> get copyWith => __$ContactsStateCopyWithImpl<_ContactsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContactsState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._contacts, _contacts)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_contacts),errorMessage);

@override
String toString() {
  return 'ContactsState(status: $status, contacts: $contacts, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$ContactsStateCopyWith<$Res> implements $ContactsStateCopyWith<$Res> {
  factory _$ContactsStateCopyWith(_ContactsState value, $Res Function(_ContactsState) _then) = __$ContactsStateCopyWithImpl;
@override @useResult
$Res call({
 ContactsStatus status, List<ContactEntity> contacts, String? errorMessage
});




}
/// @nodoc
class __$ContactsStateCopyWithImpl<$Res>
    implements _$ContactsStateCopyWith<$Res> {
  __$ContactsStateCopyWithImpl(this._self, this._then);

  final _ContactsState _self;
  final $Res Function(_ContactsState) _then;

/// Create a copy of ContactsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? contacts = null,Object? errorMessage = freezed,}) {
  return _then(_ContactsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ContactsStatus,contacts: null == contacts ? _self._contacts : contacts // ignore: cast_nullable_to_non_nullable
as List<ContactEntity>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
