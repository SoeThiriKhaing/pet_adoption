// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_pet_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AddPetState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddPetState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddPetState()';
}


}

/// @nodoc
class $AddPetStateCopyWith<$Res>  {
$AddPetStateCopyWith(AddPetState _, $Res Function(AddPetState) __);
}


/// Adds pattern-matching-related methods to [AddPetState].
extension AddPetStatePatterns on AddPetState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AddPetInitial value)?  initial,TResult Function( AddPetLoading value)?  loading,TResult Function( AddPetReady value)?  ready,TResult Function( AddPetSuccess value)?  success,TResult Function( AddPetError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AddPetInitial() when initial != null:
return initial(_that);case AddPetLoading() when loading != null:
return loading(_that);case AddPetReady() when ready != null:
return ready(_that);case AddPetSuccess() when success != null:
return success(_that);case AddPetError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AddPetInitial value)  initial,required TResult Function( AddPetLoading value)  loading,required TResult Function( AddPetReady value)  ready,required TResult Function( AddPetSuccess value)  success,required TResult Function( AddPetError value)  error,}){
final _that = this;
switch (_that) {
case AddPetInitial():
return initial(_that);case AddPetLoading():
return loading(_that);case AddPetReady():
return ready(_that);case AddPetSuccess():
return success(_that);case AddPetError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AddPetInitial value)?  initial,TResult? Function( AddPetLoading value)?  loading,TResult? Function( AddPetReady value)?  ready,TResult? Function( AddPetSuccess value)?  success,TResult? Function( AddPetError value)?  error,}){
final _that = this;
switch (_that) {
case AddPetInitial() when initial != null:
return initial(_that);case AddPetLoading() when loading != null:
return loading(_that);case AddPetReady() when ready != null:
return ready(_that);case AddPetSuccess() when success != null:
return success(_that);case AddPetError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  ready,TResult Function()?  success,TResult Function( String error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AddPetInitial() when initial != null:
return initial();case AddPetLoading() when loading != null:
return loading();case AddPetReady() when ready != null:
return ready();case AddPetSuccess() when success != null:
return success();case AddPetError() when error != null:
return error(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  ready,required TResult Function()  success,required TResult Function( String error)  error,}) {final _that = this;
switch (_that) {
case AddPetInitial():
return initial();case AddPetLoading():
return loading();case AddPetReady():
return ready();case AddPetSuccess():
return success();case AddPetError():
return error(_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  ready,TResult? Function()?  success,TResult? Function( String error)?  error,}) {final _that = this;
switch (_that) {
case AddPetInitial() when initial != null:
return initial();case AddPetLoading() when loading != null:
return loading();case AddPetReady() when ready != null:
return ready();case AddPetSuccess() when success != null:
return success();case AddPetError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class AddPetInitial implements AddPetState {
  const AddPetInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddPetInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddPetState.initial()';
}


}




/// @nodoc


class AddPetLoading implements AddPetState {
  const AddPetLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddPetLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddPetState.loading()';
}


}




/// @nodoc


class AddPetReady implements AddPetState {
  const AddPetReady();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddPetReady);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddPetState.ready()';
}


}




/// @nodoc


class AddPetSuccess implements AddPetState {
  const AddPetSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddPetSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddPetState.success()';
}


}




/// @nodoc


class AddPetError implements AddPetState {
  const AddPetError(this.error);
  

 final  String error;

/// Create a copy of AddPetState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddPetErrorCopyWith<AddPetError> get copyWith => _$AddPetErrorCopyWithImpl<AddPetError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddPetError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'AddPetState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $AddPetErrorCopyWith<$Res> implements $AddPetStateCopyWith<$Res> {
  factory $AddPetErrorCopyWith(AddPetError value, $Res Function(AddPetError) _then) = _$AddPetErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$AddPetErrorCopyWithImpl<$Res>
    implements $AddPetErrorCopyWith<$Res> {
  _$AddPetErrorCopyWithImpl(this._self, this._then);

  final AddPetError _self;
  final $Res Function(AddPetError) _then;

/// Create a copy of AddPetState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(AddPetError(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
