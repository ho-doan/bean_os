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
mixin _$PosMenuItemOptionModel {

 String get key; String get label; List<String> get values;
/// Create a copy of PosMenuItemOptionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PosMenuItemOptionModelCopyWith<PosMenuItemOptionModel> get copyWith => _$PosMenuItemOptionModelCopyWithImpl<PosMenuItemOptionModel>(this as PosMenuItemOptionModel, _$identity);

  /// Serializes this PosMenuItemOptionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PosMenuItemOptionModel&&(identical(other.key, key) || other.key == key)&&(identical(other.label, label) || other.label == label)&&const DeepCollectionEquality().equals(other.values, values));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,label,const DeepCollectionEquality().hash(values));

@override
String toString() {
  return 'PosMenuItemOptionModel(key: $key, label: $label, values: $values)';
}


}

/// @nodoc
abstract mixin class $PosMenuItemOptionModelCopyWith<$Res>  {
  factory $PosMenuItemOptionModelCopyWith(PosMenuItemOptionModel value, $Res Function(PosMenuItemOptionModel) _then) = _$PosMenuItemOptionModelCopyWithImpl;
@useResult
$Res call({
 String key, String label, List<String> values
});




}
/// @nodoc
class _$PosMenuItemOptionModelCopyWithImpl<$Res>
    implements $PosMenuItemOptionModelCopyWith<$Res> {
  _$PosMenuItemOptionModelCopyWithImpl(this._self, this._then);

  final PosMenuItemOptionModel _self;
  final $Res Function(PosMenuItemOptionModel) _then;

/// Create a copy of PosMenuItemOptionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = null,Object? label = null,Object? values = null,}) {
  return _then(_self.copyWith(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,values: null == values ? _self.values : values // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [PosMenuItemOptionModel].
extension PosMenuItemOptionModelPatterns on PosMenuItemOptionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PosMenuItemOptionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PosMenuItemOptionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PosMenuItemOptionModel value)  $default,){
final _that = this;
switch (_that) {
case _PosMenuItemOptionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PosMenuItemOptionModel value)?  $default,){
final _that = this;
switch (_that) {
case _PosMenuItemOptionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String key,  String label,  List<String> values)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PosMenuItemOptionModel() when $default != null:
return $default(_that.key,_that.label,_that.values);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String key,  String label,  List<String> values)  $default,) {final _that = this;
switch (_that) {
case _PosMenuItemOptionModel():
return $default(_that.key,_that.label,_that.values);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String key,  String label,  List<String> values)?  $default,) {final _that = this;
switch (_that) {
case _PosMenuItemOptionModel() when $default != null:
return $default(_that.key,_that.label,_that.values);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PosMenuItemOptionModel extends PosMenuItemOptionModel {
  const _PosMenuItemOptionModel({required this.key, required this.label, required final  List<String> values}): _values = values,super._();
  factory _PosMenuItemOptionModel.fromJson(Map<String, dynamic> json) => _$PosMenuItemOptionModelFromJson(json);

@override final  String key;
@override final  String label;
 final  List<String> _values;
@override List<String> get values {
  if (_values is EqualUnmodifiableListView) return _values;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_values);
}


/// Create a copy of PosMenuItemOptionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PosMenuItemOptionModelCopyWith<_PosMenuItemOptionModel> get copyWith => __$PosMenuItemOptionModelCopyWithImpl<_PosMenuItemOptionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PosMenuItemOptionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PosMenuItemOptionModel&&(identical(other.key, key) || other.key == key)&&(identical(other.label, label) || other.label == label)&&const DeepCollectionEquality().equals(other._values, _values));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,label,const DeepCollectionEquality().hash(_values));

@override
String toString() {
  return 'PosMenuItemOptionModel(key: $key, label: $label, values: $values)';
}


}

/// @nodoc
abstract mixin class _$PosMenuItemOptionModelCopyWith<$Res> implements $PosMenuItemOptionModelCopyWith<$Res> {
  factory _$PosMenuItemOptionModelCopyWith(_PosMenuItemOptionModel value, $Res Function(_PosMenuItemOptionModel) _then) = __$PosMenuItemOptionModelCopyWithImpl;
@override @useResult
$Res call({
 String key, String label, List<String> values
});




}
/// @nodoc
class __$PosMenuItemOptionModelCopyWithImpl<$Res>
    implements _$PosMenuItemOptionModelCopyWith<$Res> {
  __$PosMenuItemOptionModelCopyWithImpl(this._self, this._then);

  final _PosMenuItemOptionModel _self;
  final $Res Function(_PosMenuItemOptionModel) _then;

/// Create a copy of PosMenuItemOptionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? label = null,Object? values = null,}) {
  return _then(_PosMenuItemOptionModel(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,values: null == values ? _self._values : values // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$PosMenuItemModel {

 int get id; String get name; double get price; bool get isAvailable; String? get description; List<PosMenuItemOptionModel>? get options;
/// Create a copy of PosMenuItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PosMenuItemModelCopyWith<PosMenuItemModel> get copyWith => _$PosMenuItemModelCopyWithImpl<PosMenuItemModel>(this as PosMenuItemModel, _$identity);

  /// Serializes this PosMenuItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PosMenuItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.options, options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,price,isAvailable,description,const DeepCollectionEquality().hash(options));

@override
String toString() {
  return 'PosMenuItemModel(id: $id, name: $name, price: $price, isAvailable: $isAvailable, description: $description, options: $options)';
}


}

/// @nodoc
abstract mixin class $PosMenuItemModelCopyWith<$Res>  {
  factory $PosMenuItemModelCopyWith(PosMenuItemModel value, $Res Function(PosMenuItemModel) _then) = _$PosMenuItemModelCopyWithImpl;
@useResult
$Res call({
 int id, String name, double price, bool isAvailable, String? description, List<PosMenuItemOptionModel>? options
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? price = null,Object? isAvailable = null,Object? description = freezed,Object? options = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,options: freezed == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<PosMenuItemOptionModel>?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  double price,  bool isAvailable,  String? description,  List<PosMenuItemOptionModel>? options)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PosMenuItemModel() when $default != null:
return $default(_that.id,_that.name,_that.price,_that.isAvailable,_that.description,_that.options);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  double price,  bool isAvailable,  String? description,  List<PosMenuItemOptionModel>? options)  $default,) {final _that = this;
switch (_that) {
case _PosMenuItemModel():
return $default(_that.id,_that.name,_that.price,_that.isAvailable,_that.description,_that.options);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  double price,  bool isAvailable,  String? description,  List<PosMenuItemOptionModel>? options)?  $default,) {final _that = this;
switch (_that) {
case _PosMenuItemModel() when $default != null:
return $default(_that.id,_that.name,_that.price,_that.isAvailable,_that.description,_that.options);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PosMenuItemModel extends PosMenuItemModel {
  const _PosMenuItemModel({required this.id, required this.name, required this.price, this.isAvailable = true, this.description, final  List<PosMenuItemOptionModel>? options}): _options = options,super._();
  factory _PosMenuItemModel.fromJson(Map<String, dynamic> json) => _$PosMenuItemModelFromJson(json);

@override final  int id;
@override final  String name;
@override final  double price;
@override@JsonKey() final  bool isAvailable;
@override final  String? description;
 final  List<PosMenuItemOptionModel>? _options;
@override List<PosMenuItemOptionModel>? get options {
  final value = _options;
  if (value == null) return null;
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PosMenuItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._options, _options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,price,isAvailable,description,const DeepCollectionEquality().hash(_options));

@override
String toString() {
  return 'PosMenuItemModel(id: $id, name: $name, price: $price, isAvailable: $isAvailable, description: $description, options: $options)';
}


}

/// @nodoc
abstract mixin class _$PosMenuItemModelCopyWith<$Res> implements $PosMenuItemModelCopyWith<$Res> {
  factory _$PosMenuItemModelCopyWith(_PosMenuItemModel value, $Res Function(_PosMenuItemModel) _then) = __$PosMenuItemModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, double price, bool isAvailable, String? description, List<PosMenuItemOptionModel>? options
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? price = null,Object? isAvailable = null,Object? description = freezed,Object? options = freezed,}) {
  return _then(_PosMenuItemModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,options: freezed == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<PosMenuItemOptionModel>?,
  ));
}


}

// dart format on
