// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pos_menu_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PosMenuItemModel {

 int get id; String get name; double get price; bool get isAvailable; String? get description;
/// Create a copy of PosMenuItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PosMenuItemModelCopyWith<PosMenuItemModel> get copyWith => _$PosMenuItemModelCopyWithImpl<PosMenuItemModel>(this as PosMenuItemModel, _$identity);

  /// Serializes this PosMenuItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PosMenuItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,price,isAvailable,description);

@override
String toString() {
  return 'PosMenuItemModel(id: $id, name: $name, price: $price, isAvailable: $isAvailable, description: $description)';
}


}

/// @nodoc
abstract mixin class $PosMenuItemModelCopyWith<$Res>  {
  factory $PosMenuItemModelCopyWith(PosMenuItemModel value, $Res Function(PosMenuItemModel) _then) = _$PosMenuItemModelCopyWithImpl;
@useResult
$Res call({
 int id, String name, double price, bool isAvailable, String? description
});




}
/// @nodoc
class _$PosMenuItemModelCopyWithImpl<$Res>
    implements $PosMenuItemModelCopyWith<$Res> {
  _$PosMenuItemModelCopyWithImpl(this._self, this._then);

  final PosMenuItemModel _self;
  final $Res Function(PosMenuItemModel) _then;

/// Create a copy of PosMenuItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? price = null,Object? isAvailable = null,Object? description = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PosMenuItemModel].
extension PosMenuItemModelPatterns on PosMenuItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PosMenuItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PosMenuItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PosMenuItemModel value)  $default,){
final _that = this;
switch (_that) {
case _PosMenuItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PosMenuItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _PosMenuItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  double price,  bool isAvailable,  String? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PosMenuItemModel() when $default != null:
return $default(_that.id,_that.name,_that.price,_that.isAvailable,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  double price,  bool isAvailable,  String? description)  $default,) {final _that = this;
switch (_that) {
case _PosMenuItemModel():
return $default(_that.id,_that.name,_that.price,_that.isAvailable,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  double price,  bool isAvailable,  String? description)?  $default,) {final _that = this;
switch (_that) {
case _PosMenuItemModel() when $default != null:
return $default(_that.id,_that.name,_that.price,_that.isAvailable,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PosMenuItemModel extends PosMenuItemModel {
  const _PosMenuItemModel({required this.id, required this.name, required this.price, this.isAvailable = true, this.description}): super._();
  factory _PosMenuItemModel.fromJson(Map<String, dynamic> json) => _$PosMenuItemModelFromJson(json);

@override final  int id;
@override final  String name;
@override final  double price;
@override@JsonKey() final  bool isAvailable;
@override final  String? description;

/// Create a copy of PosMenuItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PosMenuItemModelCopyWith<_PosMenuItemModel> get copyWith => __$PosMenuItemModelCopyWithImpl<_PosMenuItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PosMenuItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PosMenuItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,price,isAvailable,description);

@override
String toString() {
  return 'PosMenuItemModel(id: $id, name: $name, price: $price, isAvailable: $isAvailable, description: $description)';
}


}

/// @nodoc
abstract mixin class _$PosMenuItemModelCopyWith<$Res> implements $PosMenuItemModelCopyWith<$Res> {
  factory _$PosMenuItemModelCopyWith(_PosMenuItemModel value, $Res Function(_PosMenuItemModel) _then) = __$PosMenuItemModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, double price, bool isAvailable, String? description
});




}
/// @nodoc
class __$PosMenuItemModelCopyWithImpl<$Res>
    implements _$PosMenuItemModelCopyWith<$Res> {
  __$PosMenuItemModelCopyWithImpl(this._self, this._then);

  final _PosMenuItemModel _self;
  final $Res Function(_PosMenuItemModel) _then;

/// Create a copy of PosMenuItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? price = null,Object? isAvailable = null,Object? description = freezed,}) {
  return _then(_PosMenuItemModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
