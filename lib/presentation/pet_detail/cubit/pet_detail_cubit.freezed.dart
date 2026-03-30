// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pet_detail_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PetDetailState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetDetailState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PetDetailState()';
}


}

/// @nodoc
class $PetDetailStateCopyWith<$Res>  {
$PetDetailStateCopyWith(PetDetailState _, $Res Function(PetDetailState) __);
}


/// Adds pattern-matching-related methods to [PetDetailState].
extension PetDetailStatePatterns on PetDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PetDetailInitial value)?  initial,TResult Function( PetDetailReady value)?  ready,TResult Function( PetDetailError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PetDetailInitial() when initial != null:
return initial(_that);case PetDetailReady() when ready != null:
return ready(_that);case PetDetailError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PetDetailInitial value)  initial,required TResult Function( PetDetailReady value)  ready,required TResult Function( PetDetailError value)  error,}){
final _that = this;
switch (_that) {
case PetDetailInitial():
return initial(_that);case PetDetailReady():
return ready(_that);case PetDetailError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PetDetailInitial value)?  initial,TResult? Function( PetDetailReady value)?  ready,TResult? Function( PetDetailError value)?  error,}){
final _that = this;
switch (_that) {
case PetDetailInitial() when initial != null:
return initial(_that);case PetDetailReady() when ready != null:
return ready(_that);case PetDetailError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( PetEntity pet)?  ready,TResult Function( String? message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PetDetailInitial() when initial != null:
return initial();case PetDetailReady() when ready != null:
return ready(_that.pet);case PetDetailError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( PetEntity pet)  ready,required TResult Function( String? message)  error,}) {final _that = this;
switch (_that) {
case PetDetailInitial():
return initial();case PetDetailReady():
return ready(_that.pet);case PetDetailError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( PetEntity pet)?  ready,TResult? Function( String? message)?  error,}) {final _that = this;
switch (_that) {
case PetDetailInitial() when initial != null:
return initial();case PetDetailReady() when ready != null:
return ready(_that.pet);case PetDetailError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class PetDetailInitial implements PetDetailState {
  const PetDetailInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetDetailInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PetDetailState.initial()';
}


}




/// @nodoc


class PetDetailReady implements PetDetailState {
  const PetDetailReady({required this.pet});
  

 final  PetEntity pet;

/// Create a copy of PetDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PetDetailReadyCopyWith<PetDetailReady> get copyWith => _$PetDetailReadyCopyWithImpl<PetDetailReady>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetDetailReady&&(identical(other.pet, pet) || other.pet == pet));
}


@override
int get hashCode => Object.hash(runtimeType,pet);

@override
String toString() {
  return 'PetDetailState.ready(pet: $pet)';
}


}

/// @nodoc
abstract mixin class $PetDetailReadyCopyWith<$Res> implements $PetDetailStateCopyWith<$Res> {
  factory $PetDetailReadyCopyWith(PetDetailReady value, $Res Function(PetDetailReady) _then) = _$PetDetailReadyCopyWithImpl;
@useResult
$Res call({
 PetEntity pet
});




}
/// @nodoc
class _$PetDetailReadyCopyWithImpl<$Res>
    implements $PetDetailReadyCopyWith<$Res> {
  _$PetDetailReadyCopyWithImpl(this._self, this._then);

  final PetDetailReady _self;
  final $Res Function(PetDetailReady) _then;

/// Create a copy of PetDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? pet = null,}) {
  return _then(PetDetailReady(
pet: null == pet ? _self.pet : pet // ignore: cast_nullable_to_non_nullable
as PetEntity,
  ));
}


}

/// @nodoc


class PetDetailError implements PetDetailState {
  const PetDetailError({this.message});
  

 final  String? message;

/// Create a copy of PetDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PetDetailErrorCopyWith<PetDetailError> get copyWith => _$PetDetailErrorCopyWithImpl<PetDetailError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetDetailError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'PetDetailState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $PetDetailErrorCopyWith<$Res> implements $PetDetailStateCopyWith<$Res> {
  factory $PetDetailErrorCopyWith(PetDetailError value, $Res Function(PetDetailError) _then) = _$PetDetailErrorCopyWithImpl;
@useResult
$Res call({
 String? message
});




}
/// @nodoc
class _$PetDetailErrorCopyWithImpl<$Res>
    implements $PetDetailErrorCopyWith<$Res> {
  _$PetDetailErrorCopyWithImpl(this._self, this._then);

  final PetDetailError _self;
  final $Res Function(PetDetailError) _then;

/// Create a copy of PetDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(PetDetailError(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
