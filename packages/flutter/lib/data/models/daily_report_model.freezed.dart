// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DailyReportModel {

 String get date; double get totalRevenue; int get orderCount;
/// Create a copy of DailyReportModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyReportModelCopyWith<DailyReportModel> get copyWith => _$DailyReportModelCopyWithImpl<DailyReportModel>(this as DailyReportModel, _$identity);

  /// Serializes this DailyReportModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyReportModel&&(identical(other.date, date) || other.date == date)&&(identical(other.totalRevenue, totalRevenue) || other.totalRevenue == totalRevenue)&&(identical(other.orderCount, orderCount) || other.orderCount == orderCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,totalRevenue,orderCount);

@override
String toString() {
  return 'DailyReportModel(date: $date, totalRevenue: $totalRevenue, orderCount: $orderCount)';
}


}

/// @nodoc
abstract mixin class $DailyReportModelCopyWith<$Res>  {
  factory $DailyReportModelCopyWith(DailyReportModel value, $Res Function(DailyReportModel) _then) = _$DailyReportModelCopyWithImpl;
@useResult
$Res call({
 String date, double totalRevenue, int orderCount
});




}
/// @nodoc
class _$DailyReportModelCopyWithImpl<$Res>
    implements $DailyReportModelCopyWith<$Res> {
  _$DailyReportModelCopyWithImpl(this._self, this._then);

  final DailyReportModel _self;
  final $Res Function(DailyReportModel) _then;

/// Create a copy of DailyReportModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? totalRevenue = null,Object? orderCount = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,totalRevenue: null == totalRevenue ? _self.totalRevenue : totalRevenue // ignore: cast_nullable_to_non_nullable
as double,orderCount: null == orderCount ? _self.orderCount : orderCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DailyReportModel].
extension DailyReportModelPatterns on DailyReportModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyReportModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyReportModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyReportModel value)  $default,){
final _that = this;
switch (_that) {
case _DailyReportModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyReportModel value)?  $default,){
final _that = this;
switch (_that) {
case _DailyReportModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String date,  double totalRevenue,  int orderCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyReportModel() when $default != null:
return $default(_that.date,_that.totalRevenue,_that.orderCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String date,  double totalRevenue,  int orderCount)  $default,) {final _that = this;
switch (_that) {
case _DailyReportModel():
return $default(_that.date,_that.totalRevenue,_that.orderCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String date,  double totalRevenue,  int orderCount)?  $default,) {final _that = this;
switch (_that) {
case _DailyReportModel() when $default != null:
return $default(_that.date,_that.totalRevenue,_that.orderCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DailyReportModel extends DailyReportModel {
  const _DailyReportModel({required this.date, required this.totalRevenue, required this.orderCount}): super._();
  factory _DailyReportModel.fromJson(Map<String, dynamic> json) => _$DailyReportModelFromJson(json);

@override final  String date;
@override final  double totalRevenue;
@override final  int orderCount;

/// Create a copy of DailyReportModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyReportModelCopyWith<_DailyReportModel> get copyWith => __$DailyReportModelCopyWithImpl<_DailyReportModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DailyReportModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyReportModel&&(identical(other.date, date) || other.date == date)&&(identical(other.totalRevenue, totalRevenue) || other.totalRevenue == totalRevenue)&&(identical(other.orderCount, orderCount) || other.orderCount == orderCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,totalRevenue,orderCount);

@override
String toString() {
  return 'DailyReportModel(date: $date, totalRevenue: $totalRevenue, orderCount: $orderCount)';
}


}

/// @nodoc
abstract mixin class _$DailyReportModelCopyWith<$Res> implements $DailyReportModelCopyWith<$Res> {
  factory _$DailyReportModelCopyWith(_DailyReportModel value, $Res Function(_DailyReportModel) _then) = __$DailyReportModelCopyWithImpl;
@override @useResult
$Res call({
 String date, double totalRevenue, int orderCount
});




}
/// @nodoc
class __$DailyReportModelCopyWithImpl<$Res>
    implements _$DailyReportModelCopyWith<$Res> {
  __$DailyReportModelCopyWithImpl(this._self, this._then);

  final _DailyReportModel _self;
  final $Res Function(_DailyReportModel) _then;

/// Create a copy of DailyReportModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? totalRevenue = null,Object? orderCount = null,}) {
  return _then(_DailyReportModel(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,totalRevenue: null == totalRevenue ? _self.totalRevenue : totalRevenue // ignore: cast_nullable_to_non_nullable
as double,orderCount: null == orderCount ? _self.orderCount : orderCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
