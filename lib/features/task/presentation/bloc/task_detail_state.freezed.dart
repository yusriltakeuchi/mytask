// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TaskDetailState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskDetailState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TaskDetailState()';
}


}

/// @nodoc
class $TaskDetailStateCopyWith<$Res>  {
$TaskDetailStateCopyWith(TaskDetailState _, $Res Function(TaskDetailState) __);
}


/// Adds pattern-matching-related methods to [TaskDetailState].
extension TaskDetailStatePatterns on TaskDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TaskDetailInitial value)?  initial,TResult Function( TaskDetailLoading value)?  loading,TResult Function( TaskDetailLoaded value)?  loaded,TResult Function( TaskDetailError value)?  error,TResult Function( TaskDetailDeleted value)?  deleted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TaskDetailInitial() when initial != null:
return initial(_that);case TaskDetailLoading() when loading != null:
return loading(_that);case TaskDetailLoaded() when loaded != null:
return loaded(_that);case TaskDetailError() when error != null:
return error(_that);case TaskDetailDeleted() when deleted != null:
return deleted(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TaskDetailInitial value)  initial,required TResult Function( TaskDetailLoading value)  loading,required TResult Function( TaskDetailLoaded value)  loaded,required TResult Function( TaskDetailError value)  error,required TResult Function( TaskDetailDeleted value)  deleted,}){
final _that = this;
switch (_that) {
case TaskDetailInitial():
return initial(_that);case TaskDetailLoading():
return loading(_that);case TaskDetailLoaded():
return loaded(_that);case TaskDetailError():
return error(_that);case TaskDetailDeleted():
return deleted(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TaskDetailInitial value)?  initial,TResult? Function( TaskDetailLoading value)?  loading,TResult? Function( TaskDetailLoaded value)?  loaded,TResult? Function( TaskDetailError value)?  error,TResult? Function( TaskDetailDeleted value)?  deleted,}){
final _that = this;
switch (_that) {
case TaskDetailInitial() when initial != null:
return initial(_that);case TaskDetailLoading() when loading != null:
return loading(_that);case TaskDetailLoaded() when loaded != null:
return loaded(_that);case TaskDetailError() when error != null:
return error(_that);case TaskDetailDeleted() when deleted != null:
return deleted(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( TaskEntity task)?  loaded,TResult Function( String message)?  error,TResult Function()?  deleted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TaskDetailInitial() when initial != null:
return initial();case TaskDetailLoading() when loading != null:
return loading();case TaskDetailLoaded() when loaded != null:
return loaded(_that.task);case TaskDetailError() when error != null:
return error(_that.message);case TaskDetailDeleted() when deleted != null:
return deleted();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( TaskEntity task)  loaded,required TResult Function( String message)  error,required TResult Function()  deleted,}) {final _that = this;
switch (_that) {
case TaskDetailInitial():
return initial();case TaskDetailLoading():
return loading();case TaskDetailLoaded():
return loaded(_that.task);case TaskDetailError():
return error(_that.message);case TaskDetailDeleted():
return deleted();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( TaskEntity task)?  loaded,TResult? Function( String message)?  error,TResult? Function()?  deleted,}) {final _that = this;
switch (_that) {
case TaskDetailInitial() when initial != null:
return initial();case TaskDetailLoading() when loading != null:
return loading();case TaskDetailLoaded() when loaded != null:
return loaded(_that.task);case TaskDetailError() when error != null:
return error(_that.message);case TaskDetailDeleted() when deleted != null:
return deleted();case _:
  return null;

}
}

}

/// @nodoc


class TaskDetailInitial implements TaskDetailState {
  const TaskDetailInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskDetailInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TaskDetailState.initial()';
}


}




/// @nodoc


class TaskDetailLoading implements TaskDetailState {
  const TaskDetailLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskDetailLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TaskDetailState.loading()';
}


}




/// @nodoc


class TaskDetailLoaded implements TaskDetailState {
  const TaskDetailLoaded(this.task);
  

 final  TaskEntity task;

/// Create a copy of TaskDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskDetailLoadedCopyWith<TaskDetailLoaded> get copyWith => _$TaskDetailLoadedCopyWithImpl<TaskDetailLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskDetailLoaded&&(identical(other.task, task) || other.task == task));
}


@override
int get hashCode => Object.hash(runtimeType,task);

@override
String toString() {
  return 'TaskDetailState.loaded(task: $task)';
}


}

/// @nodoc
abstract mixin class $TaskDetailLoadedCopyWith<$Res> implements $TaskDetailStateCopyWith<$Res> {
  factory $TaskDetailLoadedCopyWith(TaskDetailLoaded value, $Res Function(TaskDetailLoaded) _then) = _$TaskDetailLoadedCopyWithImpl;
@useResult
$Res call({
 TaskEntity task
});


$TaskEntityCopyWith<$Res> get task;

}
/// @nodoc
class _$TaskDetailLoadedCopyWithImpl<$Res>
    implements $TaskDetailLoadedCopyWith<$Res> {
  _$TaskDetailLoadedCopyWithImpl(this._self, this._then);

  final TaskDetailLoaded _self;
  final $Res Function(TaskDetailLoaded) _then;

/// Create a copy of TaskDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? task = null,}) {
  return _then(TaskDetailLoaded(
null == task ? _self.task : task // ignore: cast_nullable_to_non_nullable
as TaskEntity,
  ));
}

/// Create a copy of TaskDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TaskEntityCopyWith<$Res> get task {
  
  return $TaskEntityCopyWith<$Res>(_self.task, (value) {
    return _then(_self.copyWith(task: value));
  });
}
}

/// @nodoc


class TaskDetailError implements TaskDetailState {
  const TaskDetailError(this.message);
  

 final  String message;

/// Create a copy of TaskDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskDetailErrorCopyWith<TaskDetailError> get copyWith => _$TaskDetailErrorCopyWithImpl<TaskDetailError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskDetailError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'TaskDetailState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $TaskDetailErrorCopyWith<$Res> implements $TaskDetailStateCopyWith<$Res> {
  factory $TaskDetailErrorCopyWith(TaskDetailError value, $Res Function(TaskDetailError) _then) = _$TaskDetailErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$TaskDetailErrorCopyWithImpl<$Res>
    implements $TaskDetailErrorCopyWith<$Res> {
  _$TaskDetailErrorCopyWithImpl(this._self, this._then);

  final TaskDetailError _self;
  final $Res Function(TaskDetailError) _then;

/// Create a copy of TaskDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(TaskDetailError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class TaskDetailDeleted implements TaskDetailState {
  const TaskDetailDeleted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskDetailDeleted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TaskDetailState.deleted()';
}


}




// dart format on
