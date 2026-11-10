// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_stats_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TaskStatsEntity {

 int get totalTasks; int get completedTasks; int get pendingTasks;
/// Create a copy of TaskStatsEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskStatsEntityCopyWith<TaskStatsEntity> get copyWith => _$TaskStatsEntityCopyWithImpl<TaskStatsEntity>(this as TaskStatsEntity, _$identity);

  /// Serializes this TaskStatsEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskStatsEntity&&(identical(other.totalTasks, totalTasks) || other.totalTasks == totalTasks)&&(identical(other.completedTasks, completedTasks) || other.completedTasks == completedTasks)&&(identical(other.pendingTasks, pendingTasks) || other.pendingTasks == pendingTasks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalTasks,completedTasks,pendingTasks);

@override
String toString() {
  return 'TaskStatsEntity(totalTasks: $totalTasks, completedTasks: $completedTasks, pendingTasks: $pendingTasks)';
}


}

/// @nodoc
abstract mixin class $TaskStatsEntityCopyWith<$Res>  {
  factory $TaskStatsEntityCopyWith(TaskStatsEntity value, $Res Function(TaskStatsEntity) _then) = _$TaskStatsEntityCopyWithImpl;
@useResult
$Res call({
 int totalTasks, int completedTasks, int pendingTasks
});




}
/// @nodoc
class _$TaskStatsEntityCopyWithImpl<$Res>
    implements $TaskStatsEntityCopyWith<$Res> {
  _$TaskStatsEntityCopyWithImpl(this._self, this._then);

  final TaskStatsEntity _self;
  final $Res Function(TaskStatsEntity) _then;

/// Create a copy of TaskStatsEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalTasks = null,Object? completedTasks = null,Object? pendingTasks = null,}) {
  return _then(_self.copyWith(
totalTasks: null == totalTasks ? _self.totalTasks : totalTasks // ignore: cast_nullable_to_non_nullable
as int,completedTasks: null == completedTasks ? _self.completedTasks : completedTasks // ignore: cast_nullable_to_non_nullable
as int,pendingTasks: null == pendingTasks ? _self.pendingTasks : pendingTasks // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TaskStatsEntity].
extension TaskStatsEntityPatterns on TaskStatsEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TaskStatsEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TaskStatsEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TaskStatsEntity value)  $default,){
final _that = this;
switch (_that) {
case _TaskStatsEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TaskStatsEntity value)?  $default,){
final _that = this;
switch (_that) {
case _TaskStatsEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int totalTasks,  int completedTasks,  int pendingTasks)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TaskStatsEntity() when $default != null:
return $default(_that.totalTasks,_that.completedTasks,_that.pendingTasks);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int totalTasks,  int completedTasks,  int pendingTasks)  $default,) {final _that = this;
switch (_that) {
case _TaskStatsEntity():
return $default(_that.totalTasks,_that.completedTasks,_that.pendingTasks);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int totalTasks,  int completedTasks,  int pendingTasks)?  $default,) {final _that = this;
switch (_that) {
case _TaskStatsEntity() when $default != null:
return $default(_that.totalTasks,_that.completedTasks,_that.pendingTasks);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TaskStatsEntity implements TaskStatsEntity {
  const _TaskStatsEntity({this.totalTasks = 0, this.completedTasks = 0, this.pendingTasks = 0});
  factory _TaskStatsEntity.fromJson(Map<String, dynamic> json) => _$TaskStatsEntityFromJson(json);

@override@JsonKey() final  int totalTasks;
@override@JsonKey() final  int completedTasks;
@override@JsonKey() final  int pendingTasks;

/// Create a copy of TaskStatsEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaskStatsEntityCopyWith<_TaskStatsEntity> get copyWith => __$TaskStatsEntityCopyWithImpl<_TaskStatsEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TaskStatsEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaskStatsEntity&&(identical(other.totalTasks, totalTasks) || other.totalTasks == totalTasks)&&(identical(other.completedTasks, completedTasks) || other.completedTasks == completedTasks)&&(identical(other.pendingTasks, pendingTasks) || other.pendingTasks == pendingTasks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalTasks,completedTasks,pendingTasks);

@override
String toString() {
  return 'TaskStatsEntity(totalTasks: $totalTasks, completedTasks: $completedTasks, pendingTasks: $pendingTasks)';
}


}

/// @nodoc
abstract mixin class _$TaskStatsEntityCopyWith<$Res> implements $TaskStatsEntityCopyWith<$Res> {
  factory _$TaskStatsEntityCopyWith(_TaskStatsEntity value, $Res Function(_TaskStatsEntity) _then) = __$TaskStatsEntityCopyWithImpl;
@override @useResult
$Res call({
 int totalTasks, int completedTasks, int pendingTasks
});




}
/// @nodoc
class __$TaskStatsEntityCopyWithImpl<$Res>
    implements _$TaskStatsEntityCopyWith<$Res> {
  __$TaskStatsEntityCopyWithImpl(this._self, this._then);

  final _TaskStatsEntity _self;
  final $Res Function(_TaskStatsEntity) _then;

/// Create a copy of TaskStatsEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalTasks = null,Object? completedTasks = null,Object? pendingTasks = null,}) {
  return _then(_TaskStatsEntity(
totalTasks: null == totalTasks ? _self.totalTasks : totalTasks // ignore: cast_nullable_to_non_nullable
as int,completedTasks: null == completedTasks ? _self.completedTasks : completedTasks // ignore: cast_nullable_to_non_nullable
as int,pendingTasks: null == pendingTasks ? _self.pendingTasks : pendingTasks // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
