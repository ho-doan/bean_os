// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pos_order_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PosOrderItemModel {

 int get menuItemId; int get qty; String? get note; PosMenuItemModel? get menuItem;
/// Create a copy of PosOrderItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PosOrderItemModelCopyWith<PosOrderItemModel> get copyWith => _$PosOrderItemModelCopyWithImpl<PosOrderItemModel>(this as PosOrderItemModel, _$identity);

  /// Serializes this PosOrderItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PosOrderItemModel&&(identical(other.menuItemId, menuItemId) || other.menuItemId == menuItemId)&&(identical(other.qty, qty) || other.qty == qty)&&(identical(other.note, note) || other.note == note)&&(identical(other.menuItem, menuItem) || other.menuItem == menuItem));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,menuItemId,qty,note,menuItem);

@override
String toString() {
  return 'PosOrderItemModel(menuItemId: $menuItemId, qty: $qty, note: $note, menuItem: $menuItem)';
}


}

/// @nodoc
abstract mixin class $PosOrderItemModelCopyWith<$Res>  {
  factory $PosOrderItemModelCopyWith(PosOrderItemModel value, $Res Function(PosOrderItemModel) _then) = _$PosOrderItemModelCopyWithImpl;
@useResult
$Res call({
 int menuItemId, int qty, String? note, PosMenuItemModel? menuItem
});


$PosMenuItemModelCopyWith<$Res>? get menuItem;

}
/// @nodoc
class _$PosOrderItemModelCopyWithImpl<$Res>
    implements $PosOrderItemModelCopyWith<$Res> {
  _$PosOrderItemModelCopyWithImpl(this._self, this._then);

  final PosOrderItemModel _self;
  final $Res Function(PosOrderItemModel) _then;

/// Create a copy of PosOrderItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? menuItemId = null,Object? qty = null,Object? note = freezed,Object? menuItem = freezed,}) {
  return _then(_self.copyWith(
menuItemId: null == menuItemId ? _self.menuItemId : menuItemId // ignore: cast_nullable_to_non_nullable
as int,qty: null == qty ? _self.qty : qty // ignore: cast_nullable_to_non_nullable
as int,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,menuItem: freezed == menuItem ? _self.menuItem : menuItem // ignore: cast_nullable_to_non_nullable
as PosMenuItemModel?,
  ));
}
/// Create a copy of PosOrderItemModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PosMenuItemModelCopyWith<$Res>? get menuItem {
    if (_self.menuItem == null) {
    return null;
  }

  return $PosMenuItemModelCopyWith<$Res>(_self.menuItem!, (value) {
    return _then(_self.copyWith(menuItem: value));
  });
}
}


/// Adds pattern-matching-related methods to [PosOrderItemModel].
extension PosOrderItemModelPatterns on PosOrderItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PosOrderItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PosOrderItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PosOrderItemModel value)  $default,){
final _that = this;
switch (_that) {
case _PosOrderItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PosOrderItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _PosOrderItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int menuItemId,  int qty,  String? note,  PosMenuItemModel? menuItem)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PosOrderItemModel() when $default != null:
return $default(_that.menuItemId,_that.qty,_that.note,_that.menuItem);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int menuItemId,  int qty,  String? note,  PosMenuItemModel? menuItem)  $default,) {final _that = this;
switch (_that) {
case _PosOrderItemModel():
return $default(_that.menuItemId,_that.qty,_that.note,_that.menuItem);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int menuItemId,  int qty,  String? note,  PosMenuItemModel? menuItem)?  $default,) {final _that = this;
switch (_that) {
case _PosOrderItemModel() when $default != null:
return $default(_that.menuItemId,_that.qty,_that.note,_that.menuItem);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PosOrderItemModel extends PosOrderItemModel {
  const _PosOrderItemModel({required this.menuItemId, required this.qty, this.note, this.menuItem}): super._();
  factory _PosOrderItemModel.fromJson(Map<String, dynamic> json) => _$PosOrderItemModelFromJson(json);

@override final  int menuItemId;
@override final  int qty;
@override final  String? note;
@override final  PosMenuItemModel? menuItem;

/// Create a copy of PosOrderItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PosOrderItemModelCopyWith<_PosOrderItemModel> get copyWith => __$PosOrderItemModelCopyWithImpl<_PosOrderItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PosOrderItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PosOrderItemModel&&(identical(other.menuItemId, menuItemId) || other.menuItemId == menuItemId)&&(identical(other.qty, qty) || other.qty == qty)&&(identical(other.note, note) || other.note == note)&&(identical(other.menuItem, menuItem) || other.menuItem == menuItem));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,menuItemId,qty,note,menuItem);

@override
String toString() {
  return 'PosOrderItemModel(menuItemId: $menuItemId, qty: $qty, note: $note, menuItem: $menuItem)';
}


}

/// @nodoc
abstract mixin class _$PosOrderItemModelCopyWith<$Res> implements $PosOrderItemModelCopyWith<$Res> {
  factory _$PosOrderItemModelCopyWith(_PosOrderItemModel value, $Res Function(_PosOrderItemModel) _then) = __$PosOrderItemModelCopyWithImpl;
@override @useResult
$Res call({
 int menuItemId, int qty, String? note, PosMenuItemModel? menuItem
});


@override $PosMenuItemModelCopyWith<$Res>? get menuItem;

}
/// @nodoc
class __$PosOrderItemModelCopyWithImpl<$Res>
    implements _$PosOrderItemModelCopyWith<$Res> {
  __$PosOrderItemModelCopyWithImpl(this._self, this._then);

  final _PosOrderItemModel _self;
  final $Res Function(_PosOrderItemModel) _then;

/// Create a copy of PosOrderItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? menuItemId = null,Object? qty = null,Object? note = freezed,Object? menuItem = freezed,}) {
  return _then(_PosOrderItemModel(
menuItemId: null == menuItemId ? _self.menuItemId : menuItemId // ignore: cast_nullable_to_non_nullable
as int,qty: null == qty ? _self.qty : qty // ignore: cast_nullable_to_non_nullable
as int,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,menuItem: freezed == menuItem ? _self.menuItem : menuItem // ignore: cast_nullable_to_non_nullable
as PosMenuItemModel?,
  ));
}

/// Create a copy of PosOrderItemModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PosMenuItemModelCopyWith<$Res>? get menuItem {
    if (_self.menuItem == null) {
    return null;
  }

  return $PosMenuItemModelCopyWith<$Res>(_self.menuItem!, (value) {
    return _then(_self.copyWith(menuItem: value));
  });
}
}

// dart format on
