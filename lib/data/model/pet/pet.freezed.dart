// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PetModel {

 String get id; String get name; String get category; String get breed; int get age; String get imageUrl; DateTime? get createdAt; bool get isFavorite;
/// Create a copy of PetModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PetModelCopyWith<PetModel> get copyWith => _$PetModelCopyWithImpl<PetModel>(this as PetModel, _$identity);

  /// Serializes this PetModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.category, category) || other.category == category)&&(identical(other.breed, breed) || other.breed == breed)&&(identical(other.age, age) || other.age == age)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,category,breed,age,imageUrl,createdAt,isFavorite);

@override
String toString() {
  return 'PetModel(id: $id, name: $name, category: $category, breed: $breed, age: $age, imageUrl: $imageUrl, createdAt: $createdAt, isFavorite: $isFavorite)';
}


}

/// @nodoc
abstract mixin class $PetModelCopyWith<$Res>  {
  factory $PetModelCopyWith(PetModel value, $Res Function(PetModel) _then) = _$PetModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String category, String breed, int age, String imageUrl, DateTime? createdAt, bool isFavorite
});




}
/// @nodoc
class _$PetModelCopyWithImpl<$Res>
    implements $PetModelCopyWith<$Res> {
  _$PetModelCopyWithImpl(this._self, this._then);

  final PetModel _self;
  final $Res Function(PetModel) _then;

/// Create a copy of PetModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? category = null,Object? breed = null,Object? age = null,Object? imageUrl = null,Object? createdAt = freezed,Object? isFavorite = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,breed: null == breed ? _self.breed : breed // ignore: cast_nullable_to_non_nullable
as String,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PetModel].
extension PetModelPatterns on PetModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PetModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PetModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PetModel value)  $default,){
final _that = this;
switch (_that) {
case _PetModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PetModel value)?  $default,){
final _that = this;
switch (_that) {
case _PetModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String category,  String breed,  int age,  String imageUrl,  DateTime? createdAt,  bool isFavorite)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PetModel() when $default != null:
return $default(_that.id,_that.name,_that.category,_that.breed,_that.age,_that.imageUrl,_that.createdAt,_that.isFavorite);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String category,  String breed,  int age,  String imageUrl,  DateTime? createdAt,  bool isFavorite)  $default,) {final _that = this;
switch (_that) {
case _PetModel():
return $default(_that.id,_that.name,_that.category,_that.breed,_that.age,_that.imageUrl,_that.createdAt,_that.isFavorite);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String category,  String breed,  int age,  String imageUrl,  DateTime? createdAt,  bool isFavorite)?  $default,) {final _that = this;
switch (_that) {
case _PetModel() when $default != null:
return $default(_that.id,_that.name,_that.category,_that.breed,_that.age,_that.imageUrl,_that.createdAt,_that.isFavorite);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PetModel implements PetModel {
  const _PetModel({required this.id, required this.name, required this.category, required this.breed, required this.age, required this.imageUrl, required this.createdAt, this.isFavorite = false});
  factory _PetModel.fromJson(Map<String, dynamic> json) => _$PetModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String category;
@override final  String breed;
@override final  int age;
@override final  String imageUrl;
@override final  DateTime? createdAt;
@override@JsonKey() final  bool isFavorite;

/// Create a copy of PetModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PetModelCopyWith<_PetModel> get copyWith => __$PetModelCopyWithImpl<_PetModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PetModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PetModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.category, category) || other.category == category)&&(identical(other.breed, breed) || other.breed == breed)&&(identical(other.age, age) || other.age == age)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,category,breed,age,imageUrl,createdAt,isFavorite);

@override
String toString() {
  return 'PetModel(id: $id, name: $name, category: $category, breed: $breed, age: $age, imageUrl: $imageUrl, createdAt: $createdAt, isFavorite: $isFavorite)';
}


}

/// @nodoc
abstract mixin class _$PetModelCopyWith<$Res> implements $PetModelCopyWith<$Res> {
  factory _$PetModelCopyWith(_PetModel value, $Res Function(_PetModel) _then) = __$PetModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String category, String breed, int age, String imageUrl, DateTime? createdAt, bool isFavorite
});




}
/// @nodoc
class __$PetModelCopyWithImpl<$Res>
    implements _$PetModelCopyWith<$Res> {
  __$PetModelCopyWithImpl(this._self, this._then);

  final _PetModel _self;
  final $Res Function(_PetModel) _then;

/// Create a copy of PetModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? category = null,Object? breed = null,Object? age = null,Object? imageUrl = null,Object? createdAt = freezed,Object? isFavorite = null,}) {
  return _then(_PetModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,breed: null == breed ? _self.breed : breed // ignore: cast_nullable_to_non_nullable
as String,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
