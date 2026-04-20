// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pos_order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PosOrderModel {

 int get id; int get tableId; String get status; List<PosOrderItemModel> get items; DateTime? get createdAt;
/// Create a copy of PosOrderModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PosOrderModelCopyWith<PosOrderModel> get copyWith => _$PosOrderModelCopyWithImpl<PosOrderModel>(this as PosOrderModel, _$identity);

  /// Serializes this PosOrderModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PosOrderModel&&(identical(other.id, id) || other.id == id)&&(identical(other.tableId, tableId) || other.tableId == tableId)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tableId,status,const DeepCollectionEquality().hash(items),createdAt);

@override
String toString() {
  return 'PosOrderModel(id: $id, tableId: $tableId, status: $status, items: $items, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $PosOrderModelCopyWith<$Res>  {
  factory $PosOrderModelCopyWith(PosOrderModel value, $Res Function(PosOrderModel) _then) = _$PosOrderModelCopyWithImpl;
@useResult
$Res call({
 int id, int tableId, String status, List<PosOrderItemModel> items, DateTime? createdAt
});




}
/// @nodoc
class _$PosOrderModelCopyWithImpl<$Res>
    implements $PosOrderModelCopyWith<$Res> {
  _$PosOrderModelCopyWithImpl(this._self, this._then);

  final PosOrderModel _self;
  final $Res Function(PosOrderModel) _then;

/// Create a copy of PosOrderModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? tableId = null,Object? status = null,Object? items = null,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,tableId: null == tableId ? _self.tableId : tableId // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<PosOrderItemModel>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [PosOrderModel].
extension PosOrderModelPatterns on PosOrderModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PosOrderModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PosOrderModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PosOrderModel value)  $default,){
final _that = this;
switch (_that) {
case _PosOrderModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PosOrderModel value)?  $default,){
final _that = this;
switch (_that) {
case _PosOrderModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int tableId,  String status,  List<PosOrderItemModel> items,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PosOrderModel() when $default != null:
return $default(_that.id,_that.tableId,_that.status,_that.items,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int tableId,  String status,  List<PosOrderItemModel> items,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _PosOrderModel():
return $default(_that.id,_that.tableId,_that.status,_that.items,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int tableId,  String status,  List<PosOrderItemModel> items,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _PosOrderModel() when $default != null:
return $default(_that.id,_that.tableId,_that.status,_that.items,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PosOrderModel extends PosOrderModel {
  const _PosOrderModel({required this.id, required this.tableId, required this.status, final  List<PosOrderItemModel> items = const <PosOrderItemModel>[], this.createdAt}): _items = items,super._();
  factory _PosOrderModel.fromJson(Map<String, dynamic> json) => _$PosOrderModelFromJson(json);

@override final  int id;
@override final  int tableId;
@override final  String status;
 final  List<PosOrderItemModel> _items;
@override@JsonKey() List<PosOrderItemModel> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  DateTime? createdAt;

/// Create a copy of PosOrderModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PosOrderModelCopyWith<_PosOrderModel> get copyWith => __$PosOrderModelCopyWithImpl<_PosOrderModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PosOrderModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PosOrderModel&&(identical(other.id, id) || other.id == id)&&(identical(other.tableId, tableId) || other.tableId == tableId)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tableId,status,const DeepCollectionEquality().hash(_items),createdAt);

@override
String toString() {
  return 'PosOrderModel(id: $id, tableId: $tableId, status: $status, items: $items, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$PosOrderModelCopyWith<$Res> implements $PosOrderModelCopyWith<$Res> {
  factory _$PosOrderModelCopyWith(_PosOrderModel value, $Res Function(_PosOrderModel) _then) = __$PosOrderModelCopyWithImpl;
@override @useResult
$Res call({
 int id, int tableId, String status, List<PosOrderItemModel> items, DateTime? createdAt
});




}
/// @nodoc
class __$PosOrderModelCopyWithImpl<$Res>
    implements _$PosOrderModelCopyWith<$Res> {
  __$PosOrderModelCopyWithImpl(this._self, this._then);

  final _PosOrderModel _self;
  final $Res Function(_PosOrderModel) _then;

/// Create a copy of PosOrderModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? tableId = null,Object? status = null,Object? items = null,Object? createdAt = freezed,}) {
  return _then(_PosOrderModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,tableId: null == tableId ? _self.tableId : tableId // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<PosOrderItemModel>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
