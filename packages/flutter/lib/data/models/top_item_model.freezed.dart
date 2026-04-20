// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'top_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TopItemModel {

 int get menuItemId; String get name; int get qtySold;
/// Create a copy of TopItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TopItemModelCopyWith<TopItemModel> get copyWith => _$TopItemModelCopyWithImpl<TopItemModel>(this as TopItemModel, _$identity);

  /// Serializes this TopItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopItemModel&&(identical(other.menuItemId, menuItemId) || other.menuItemId == menuItemId)&&(identical(other.name, name) || other.name == name)&&(identical(other.qtySold, qtySold) || other.qtySold == qtySold));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,menuItemId,name,qtySold);

@override
String toString() {
  return 'TopItemModel(menuItemId: $menuItemId, name: $name, qtySold: $qtySold)';
}


}

/// @nodoc
abstract mixin class $TopItemModelCopyWith<$Res>  {
  factory $TopItemModelCopyWith(TopItemModel value, $Res Function(TopItemModel) _then) = _$TopItemModelCopyWithImpl;
@useResult
$Res call({
 int menuItemId, String name, int qtySold
});




}
/// @nodoc
class _$TopItemModelCopyWithImpl<$Res>
    implements $TopItemModelCopyWith<$Res> {
  _$TopItemModelCopyWithImpl(this._self, this._then);

  final TopItemModel _self;
  final $Res Function(TopItemModel) _then;

/// Create a copy of TopItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? menuItemId = null,Object? name = null,Object? qtySold = null,}) {
  return _then(_self.copyWith(
menuItemId: null == menuItemId ? _self.menuItemId : menuItemId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,qtySold: null == qtySold ? _self.qtySold : qtySold // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TopItemModel].
extension TopItemModelPatterns on TopItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TopItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TopItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TopItemModel value)  $default,){
final _that = this;
switch (_that) {
case _TopItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TopItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _TopItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int menuItemId,  String name,  int qtySold)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TopItemModel() when $default != null:
return $default(_that.menuItemId,_that.name,_that.qtySold);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int menuItemId,  String name,  int qtySold)  $default,) {final _that = this;
switch (_that) {
case _TopItemModel():
return $default(_that.menuItemId,_that.name,_that.qtySold);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int menuItemId,  String name,  int qtySold)?  $default,) {final _that = this;
switch (_that) {
case _TopItemModel() when $default != null:
return $default(_that.menuItemId,_that.name,_that.qtySold);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TopItemModel extends TopItemModel {
  const _TopItemModel({required this.menuItemId, required this.name, required this.qtySold}): super._();
  factory _TopItemModel.fromJson(Map<String, dynamic> json) => _$TopItemModelFromJson(json);

@override final  int menuItemId;
@override final  String name;
@override final  int qtySold;

/// Create a copy of TopItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TopItemModelCopyWith<_TopItemModel> get copyWith => __$TopItemModelCopyWithImpl<_TopItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TopItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TopItemModel&&(identical(other.menuItemId, menuItemId) || other.menuItemId == menuItemId)&&(identical(other.name, name) || other.name == name)&&(identical(other.qtySold, qtySold) || other.qtySold == qtySold));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,menuItemId,name,qtySold);

@override
String toString() {
  return 'TopItemModel(menuItemId: $menuItemId, name: $name, qtySold: $qtySold)';
}


}

/// @nodoc
abstract mixin class _$TopItemModelCopyWith<$Res> implements $TopItemModelCopyWith<$Res> {
  factory _$TopItemModelCopyWith(_TopItemModel value, $Res Function(_TopItemModel) _then) = __$TopItemModelCopyWithImpl;
@override @useResult
$Res call({
 int menuItemId, String name, int qtySold
});




}
/// @nodoc
class __$TopItemModelCopyWithImpl<$Res>
    implements _$TopItemModelCopyWith<$Res> {
  __$TopItemModelCopyWithImpl(this._self, this._then);

  final _TopItemModel _self;
  final $Res Function(_TopItemModel) _then;

/// Create a copy of TopItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? menuItemId = null,Object? name = null,Object? qtySold = null,}) {
  return _then(_TopItemModel(
menuItemId: null == menuItemId ? _self.menuItemId : menuItemId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,qtySold: null == qtySold ? _self.qtySold : qtySold // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
