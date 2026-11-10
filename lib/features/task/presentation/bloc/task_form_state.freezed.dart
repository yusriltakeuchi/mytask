// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TaskFormState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskFormState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TaskFormState()';
}


}

/// @nodoc
class $TaskFormStateCopyWith<$Res>  {
$TaskFormStateCopyWith(TaskFormState _, $Res Function(TaskFormState) __);
}


/// Adds pattern-matching-related methods to [TaskFormState].
extension TaskFormStatePatterns on TaskFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TaskFormInitial value)?  initial,TResult Function( TaskFormSubmitting value)?  submitting,TResult Function( TaskFormSuccess value)?  success,TResult Function( TaskFormError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TaskFormInitial() when initial != null:
return initial(_that);case TaskFormSubmitting() when submitting != null:
return submitting(_that);case TaskFormSuccess() when success != null:
return success(_that);case TaskFormError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TaskFormInitial value)  initial,required TResult Function( TaskFormSubmitting value)  submitting,required TResult Function( TaskFormSuccess value)  success,required TResult Function( TaskFormError value)  error,}){
final _that = this;
switch (_that) {
case TaskFormInitial():
return initial(_that);case TaskFormSubmitting():
return submitting(_that);case TaskFormSuccess():
return success(_that);case TaskFormError():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TaskFormInitial value)?  initial,TResult? Function( TaskFormSubmitting value)?  submitting,TResult? Function( TaskFormSuccess value)?  success,TResult? Function( TaskFormError value)?  error,}){
final _that = this;
switch (_that) {
case TaskFormInitial() when initial != null:
return initial(_that);case TaskFormSubmitting() when submitting != null:
return submitting(_that);case TaskFormSuccess() when success != null:
return success(_that);case TaskFormError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  submitting,TResult Function( String message,  TaskEntity task)?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TaskFormInitial() when initial != null:
return initial();case TaskFormSubmitting() when submitting != null:
return submitting();case TaskFormSuccess() when success != null:
return success(_that.message,_that.task);case TaskFormError() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  submitting,required TResult Function( String message,  TaskEntity task)  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case TaskFormInitial():
return initial();case TaskFormSubmitting():
return submitting();case TaskFormSuccess():
return success(_that.message,_that.task);case TaskFormError():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  submitting,TResult? Function( String message,  TaskEntity task)?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case TaskFormInitial() when initial != null:
return initial();case TaskFormSubmitting() when submitting != null:
return submitting();case TaskFormSuccess() when success != null:
return success(_that.message,_that.task);case TaskFormError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class TaskFormInitial implements TaskFormState {
  const TaskFormInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskFormInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TaskFormState.initial()';
}


}




/// @nodoc


class TaskFormSubmitting implements TaskFormState {
  const TaskFormSubmitting();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskFormSubmitting);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TaskFormState.submitting()';
}


}




/// @nodoc


class TaskFormSuccess implements TaskFormState {
  const TaskFormSuccess({required this.message, required this.task});
  

 final  String message;
 final  TaskEntity task;

/// Create a copy of TaskFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskFormSuccessCopyWith<TaskFormSuccess> get copyWith => _$TaskFormSuccessCopyWithImpl<TaskFormSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskFormSuccess&&(identical(other.message, message) || other.message == message)&&(identical(other.task, task) || other.task == task));
}


@override
int get hashCode => Object.hash(runtimeType,message,task);

@override
String toString() {
  return 'TaskFormState.success(message: $message, task: $task)';
}


}

/// @nodoc
abstract mixin class $TaskFormSuccessCopyWith<$Res> implements $TaskFormStateCopyWith<$Res> {
  factory $TaskFormSuccessCopyWith(TaskFormSuccess value, $Res Function(TaskFormSuccess) _then) = _$TaskFormSuccessCopyWithImpl;
@useResult
$Res call({
 String message, TaskEntity task
});


$TaskEntityCopyWith<$Res> get task;

}
/// @nodoc
class _$TaskFormSuccessCopyWithImpl<$Res>
    implements $TaskFormSuccessCopyWith<$Res> {
  _$TaskFormSuccessCopyWithImpl(this._self, this._then);

  final TaskFormSuccess _self;
  final $Res Function(TaskFormSuccess) _then;

/// Create a copy of TaskFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,Object? task = null,}) {
  return _then(TaskFormSuccess(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,task: null == task ? _self.task : task // ignore: cast_nullable_to_non_nullable
as TaskEntity,
  ));
}

/// Create a copy of TaskFormState
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


class TaskFormError implements TaskFormState {
  const TaskFormError(this.message);
  

 final  String message;

/// Create a copy of TaskFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskFormErrorCopyWith<TaskFormError> get copyWith => _$TaskFormErrorCopyWithImpl<TaskFormError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskFormError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'TaskFormState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $TaskFormErrorCopyWith<$Res> implements $TaskFormStateCopyWith<$Res> {
  factory $TaskFormErrorCopyWith(TaskFormError value, $Res Function(TaskFormError) _then) = _$TaskFormErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$TaskFormErrorCopyWithImpl<$Res>
    implements $TaskFormErrorCopyWith<$Res> {
  _$TaskFormErrorCopyWithImpl(this._self, this._then);

  final TaskFormError _self;
  final $Res Function(TaskFormError) _then;

/// Create a copy of TaskFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(TaskFormError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
