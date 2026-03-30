// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FavoriteState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FavoriteState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FavoriteState()';
}


}

/// @nodoc
class $FavoriteStateCopyWith<$Res>  {
$FavoriteStateCopyWith(FavoriteState _, $Res Function(FavoriteState) __);
}


/// Adds pattern-matching-related methods to [FavoriteState].
extension FavoriteStatePatterns on FavoriteState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( FavoriteInitial value)?  initial,TResult Function( FavoriteReady value)?  ready,TResult Function( FavoriteSuccess value)?  success,TResult Function( FavoriteError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case FavoriteInitial() when initial != null:
return initial(_that);case FavoriteReady() when ready != null:
return ready(_that);case FavoriteSuccess() when success != null:
return success(_that);case FavoriteError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( FavoriteInitial value)  initial,required TResult Function( FavoriteReady value)  ready,required TResult Function( FavoriteSuccess value)  success,required TResult Function( FavoriteError value)  error,}){
final _that = this;
switch (_that) {
case FavoriteInitial():
return initial(_that);case FavoriteReady():
return ready(_that);case FavoriteSuccess():
return success(_that);case FavoriteError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( FavoriteInitial value)?  initial,TResult? Function( FavoriteReady value)?  ready,TResult? Function( FavoriteSuccess value)?  success,TResult? Function( FavoriteError value)?  error,}){
final _that = this;
switch (_that) {
case FavoriteInitial() when initial != null:
return initial(_that);case FavoriteReady() when ready != null:
return ready(_that);case FavoriteSuccess() when success != null:
return success(_that);case FavoriteError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  ready,TResult Function()?  success,TResult Function( String? error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case FavoriteInitial() when initial != null:
return initial();case FavoriteReady() when ready != null:
return ready();case FavoriteSuccess() when success != null:
return success();case FavoriteError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  ready,required TResult Function()  success,required TResult Function( String? error)  error,}) {final _that = this;
switch (_that) {
case FavoriteInitial():
return initial();case FavoriteReady():
return ready();case FavoriteSuccess():
return success();case FavoriteError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  ready,TResult? Function()?  success,TResult? Function( String? error)?  error,}) {final _that = this;
switch (_that) {
case FavoriteInitial() when initial != null:
return initial();case FavoriteReady() when ready != null:
return ready();case FavoriteSuccess() when success != null:
return success();case FavoriteError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class FavoriteInitial implements FavoriteState {
  const FavoriteInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FavoriteInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FavoriteState.initial()';
}


}




/// @nodoc


class FavoriteReady implements FavoriteState {
  const FavoriteReady();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FavoriteReady);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FavoriteState.ready()';
}


}




/// @nodoc


class FavoriteSuccess implements FavoriteState {
  const FavoriteSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FavoriteSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FavoriteState.success()';
}


}




/// @nodoc


class FavoriteError implements FavoriteState {
  const FavoriteError({this.error});
  

 final  String? error;

/// Create a copy of FavoriteState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FavoriteErrorCopyWith<FavoriteError> get copyWith => _$FavoriteErrorCopyWithImpl<FavoriteError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FavoriteError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'FavoriteState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $FavoriteErrorCopyWith<$Res> implements $FavoriteStateCopyWith<$Res> {
  factory $FavoriteErrorCopyWith(FavoriteError value, $Res Function(FavoriteError) _then) = _$FavoriteErrorCopyWithImpl;
@useResult
$Res call({
 String? error
});




}
/// @nodoc
class _$FavoriteErrorCopyWithImpl<$Res>
    implements $FavoriteErrorCopyWith<$Res> {
  _$FavoriteErrorCopyWithImpl(this._self, this._then);

  final FavoriteError _self;
  final $Res Function(FavoriteError) _then;

/// Create a copy of FavoriteState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = freezed,}) {
  return _then(FavoriteError(
error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
