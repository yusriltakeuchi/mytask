// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SubTaskEntity {

 String get id; String get title;@JsonKey(name: 'is_done') bool get isDone;
/// Create a copy of SubTaskEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubTaskEntityCopyWith<SubTaskEntity> get copyWith => _$SubTaskEntityCopyWithImpl<SubTaskEntity>(this as SubTaskEntity, _$identity);

  /// Serializes this SubTaskEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubTaskEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.isDone, isDone) || other.isDone == isDone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,isDone);

@override
String toString() {
  return 'SubTaskEntity(id: $id, title: $title, isDone: $isDone)';
}


}

/// @nodoc
abstract mixin class $SubTaskEntityCopyWith<$Res>  {
  factory $SubTaskEntityCopyWith(SubTaskEntity value, $Res Function(SubTaskEntity) _then) = _$SubTaskEntityCopyWithImpl;
@useResult
$Res call({
 String id, String title,@JsonKey(name: 'is_done') bool isDone
});




}
/// @nodoc
class _$SubTaskEntityCopyWithImpl<$Res>
    implements $SubTaskEntityCopyWith<$Res> {
  _$SubTaskEntityCopyWithImpl(this._self, this._then);

  final SubTaskEntity _self;
  final $Res Function(SubTaskEntity) _then;

/// Create a copy of SubTaskEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? isDone = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,isDone: null == isDone ? _self.isDone : isDone // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SubTaskEntity].
extension SubTaskEntityPatterns on SubTaskEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubTaskEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubTaskEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubTaskEntity value)  $default,){
final _that = this;
switch (_that) {
case _SubTaskEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubTaskEntity value)?  $default,){
final _that = this;
switch (_that) {
case _SubTaskEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title, @JsonKey(name: 'is_done')  bool isDone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubTaskEntity() when $default != null:
return $default(_that.id,_that.title,_that.isDone);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title, @JsonKey(name: 'is_done')  bool isDone)  $default,) {final _that = this;
switch (_that) {
case _SubTaskEntity():
return $default(_that.id,_that.title,_that.isDone);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title, @JsonKey(name: 'is_done')  bool isDone)?  $default,) {final _that = this;
switch (_that) {
case _SubTaskEntity() when $default != null:
return $default(_that.id,_that.title,_that.isDone);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SubTaskEntity implements SubTaskEntity {
  const _SubTaskEntity({required this.id, required this.title, @JsonKey(name: 'is_done') this.isDone = false});
  factory _SubTaskEntity.fromJson(Map<String, dynamic> json) => _$SubTaskEntityFromJson(json);

@override final  String id;
@override final  String title;
@override@JsonKey(name: 'is_done') final  bool isDone;

/// Create a copy of SubTaskEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubTaskEntityCopyWith<_SubTaskEntity> get copyWith => __$SubTaskEntityCopyWithImpl<_SubTaskEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubTaskEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubTaskEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.isDone, isDone) || other.isDone == isDone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,isDone);

@override
String toString() {
  return 'SubTaskEntity(id: $id, title: $title, isDone: $isDone)';
}


}

/// @nodoc
abstract mixin class _$SubTaskEntityCopyWith<$Res> implements $SubTaskEntityCopyWith<$Res> {
  factory _$SubTaskEntityCopyWith(_SubTaskEntity value, $Res Function(_SubTaskEntity) _then) = __$SubTaskEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String title,@JsonKey(name: 'is_done') bool isDone
});




}
/// @nodoc
class __$SubTaskEntityCopyWithImpl<$Res>
    implements _$SubTaskEntityCopyWith<$Res> {
  __$SubTaskEntityCopyWithImpl(this._self, this._then);

  final _SubTaskEntity _self;
  final $Res Function(_SubTaskEntity) _then;

/// Create a copy of SubTaskEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? isDone = null,}) {
  return _then(_SubTaskEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,isDone: null == isDone ? _self.isDone : isDone // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$TaskEntity {

 int? get id; String get title; String get course; DateTime get deadline;@JsonKey(name: 'is_completed') bool get isCompleted; TaskPriority get priority; String? get description; List<SubTaskEntity> get subtasks;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;
/// Create a copy of TaskEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskEntityCopyWith<TaskEntity> get copyWith => _$TaskEntityCopyWithImpl<TaskEntity>(this as TaskEntity, _$identity);

  /// Serializes this TaskEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.course, course) || other.course == course)&&(identical(other.deadline, deadline) || other.deadline == deadline)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.subtasks, subtasks)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,course,deadline,isCompleted,priority,description,const DeepCollectionEquality().hash(subtasks),createdAt,updatedAt);

@override
String toString() {
  return 'TaskEntity(id: $id, title: $title, course: $course, deadline: $deadline, isCompleted: $isCompleted, priority: $priority, description: $description, subtasks: $subtasks, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $TaskEntityCopyWith<$Res>  {
  factory $TaskEntityCopyWith(TaskEntity value, $Res Function(TaskEntity) _then) = _$TaskEntityCopyWithImpl;
@useResult
$Res call({
 int? id, String title, String course, DateTime deadline,@JsonKey(name: 'is_completed') bool isCompleted, TaskPriority priority, String? description, List<SubTaskEntity> subtasks,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class _$TaskEntityCopyWithImpl<$Res>
    implements $TaskEntityCopyWith<$Res> {
  _$TaskEntityCopyWithImpl(this._self, this._then);

  final TaskEntity _self;
  final $Res Function(TaskEntity) _then;

/// Create a copy of TaskEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? title = null,Object? course = null,Object? deadline = null,Object? isCompleted = null,Object? priority = null,Object? description = freezed,Object? subtasks = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,course: null == course ? _self.course : course // ignore: cast_nullable_to_non_nullable
as String,deadline: null == deadline ? _self.deadline : deadline // ignore: cast_nullable_to_non_nullable
as DateTime,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as TaskPriority,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,subtasks: null == subtasks ? _self.subtasks : subtasks // ignore: cast_nullable_to_non_nullable
as List<SubTaskEntity>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [TaskEntity].
extension TaskEntityPatterns on TaskEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TaskEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TaskEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TaskEntity value)  $default,){
final _that = this;
switch (_that) {
case _TaskEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TaskEntity value)?  $default,){
final _that = this;
switch (_that) {
case _TaskEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String title,  String course,  DateTime deadline, @JsonKey(name: 'is_completed')  bool isCompleted,  TaskPriority priority,  String? description,  List<SubTaskEntity> subtasks, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TaskEntity() when $default != null:
return $default(_that.id,_that.title,_that.course,_that.deadline,_that.isCompleted,_that.priority,_that.description,_that.subtasks,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String title,  String course,  DateTime deadline, @JsonKey(name: 'is_completed')  bool isCompleted,  TaskPriority priority,  String? description,  List<SubTaskEntity> subtasks, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _TaskEntity():
return $default(_that.id,_that.title,_that.course,_that.deadline,_that.isCompleted,_that.priority,_that.description,_that.subtasks,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String title,  String course,  DateTime deadline, @JsonKey(name: 'is_completed')  bool isCompleted,  TaskPriority priority,  String? description,  List<SubTaskEntity> subtasks, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _TaskEntity() when $default != null:
return $default(_that.id,_that.title,_that.course,_that.deadline,_that.isCompleted,_that.priority,_that.description,_that.subtasks,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TaskEntity extends TaskEntity {
  const _TaskEntity({this.id, required this.title, required this.course, required this.deadline, @JsonKey(name: 'is_completed') this.isCompleted = false, this.priority = TaskPriority.medium, this.description, final  List<SubTaskEntity> subtasks = const [], @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt}): _subtasks = subtasks,super._();
  factory _TaskEntity.fromJson(Map<String, dynamic> json) => _$TaskEntityFromJson(json);

@override final  int? id;
@override final  String title;
@override final  String course;
@override final  DateTime deadline;
@override@JsonKey(name: 'is_completed') final  bool isCompleted;
@override@JsonKey() final  TaskPriority priority;
@override final  String? description;
 final  List<SubTaskEntity> _subtasks;
@override@JsonKey() List<SubTaskEntity> get subtasks {
  if (_subtasks is EqualUnmodifiableListView) return _subtasks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_subtasks);
}

@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;

/// Create a copy of TaskEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaskEntityCopyWith<_TaskEntity> get copyWith => __$TaskEntityCopyWithImpl<_TaskEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TaskEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaskEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.course, course) || other.course == course)&&(identical(other.deadline, deadline) || other.deadline == deadline)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._subtasks, _subtasks)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,course,deadline,isCompleted,priority,description,const DeepCollectionEquality().hash(_subtasks),createdAt,updatedAt);

@override
String toString() {
  return 'TaskEntity(id: $id, title: $title, course: $course, deadline: $deadline, isCompleted: $isCompleted, priority: $priority, description: $description, subtasks: $subtasks, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$TaskEntityCopyWith<$Res> implements $TaskEntityCopyWith<$Res> {
  factory _$TaskEntityCopyWith(_TaskEntity value, $Res Function(_TaskEntity) _then) = __$TaskEntityCopyWithImpl;
@override @useResult
$Res call({
 int? id, String title, String course, DateTime deadline,@JsonKey(name: 'is_completed') bool isCompleted, TaskPriority priority, String? description, List<SubTaskEntity> subtasks,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class __$TaskEntityCopyWithImpl<$Res>
    implements _$TaskEntityCopyWith<$Res> {
  __$TaskEntityCopyWithImpl(this._self, this._then);

  final _TaskEntity _self;
  final $Res Function(_TaskEntity) _then;

/// Create a copy of TaskEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? title = null,Object? course = null,Object? deadline = null,Object? isCompleted = null,Object? priority = null,Object? description = freezed,Object? subtasks = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_TaskEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,course: null == course ? _self.course : course // ignore: cast_nullable_to_non_nullable
as String,deadline: null == deadline ? _self.deadline : deadline // ignore: cast_nullable_to_non_nullable
as DateTime,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as TaskPriority,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,subtasks: null == subtasks ? _self._subtasks : subtasks // ignore: cast_nullable_to_non_nullable
as List<SubTaskEntity>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
