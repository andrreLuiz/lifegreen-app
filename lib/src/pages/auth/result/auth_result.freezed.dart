// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthResult {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthResult);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthResult()';
}


}

/// @nodoc
class $AuthResultCopyWith<$Res>  {
$AuthResultCopyWith(AuthResult _, $Res Function(AuthResult) __);
}


/// @nodoc


class OnSuccess implements AuthResult {
   OnSuccess(this.user);
  

 final  UserModel user;

/// Create a copy of AuthResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnSuccessCopyWith<OnSuccess> get copyWith => _$OnSuccessCopyWithImpl<OnSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnSuccess&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'AuthResult.success(user: $user)';
}

  @override
  void when({required Null Function(dynamic user) success, required Null Function(dynamic message) error}) {
    // TODO: implement when
  }


}

/// @nodoc
abstract mixin class $OnSuccessCopyWith<$Res> implements $AuthResultCopyWith<$Res> {
  factory $OnSuccessCopyWith(OnSuccess value, $Res Function(OnSuccess) _then) = _$OnSuccessCopyWithImpl;
@useResult
$Res call({
 UserModel user
});




}
/// @nodoc
class _$OnSuccessCopyWithImpl<$Res>
    implements $OnSuccessCopyWith<$Res> {
  _$OnSuccessCopyWithImpl(this._self, this._then);

  final OnSuccess _self;
  final $Res Function(OnSuccess) _then;

/// Create a copy of AuthResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(OnSuccess(
null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel,
  ));
}


}

/// @nodoc


class OnError implements AuthResult {
   OnError(this.message);
  

 final  String message;

/// Create a copy of AuthResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnErrorCopyWith<OnError> get copyWith => _$OnErrorCopyWithImpl<OnError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AuthResult.error(message: $message)';
}

  @override
  void when({required Null Function(dynamic user) success, required Null Function(dynamic message) error}) {
    // TODO: implement when
  }


}

/// @nodoc
abstract mixin class $OnErrorCopyWith<$Res> implements $AuthResultCopyWith<$Res> {
  factory $OnErrorCopyWith(OnError value, $Res Function(OnError) _then) = _$OnErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$OnErrorCopyWithImpl<$Res>
    implements $OnErrorCopyWith<$Res> {
  _$OnErrorCopyWithImpl(this._self, this._then);

  final OnError _self;
  final $Res Function(OnError) _then;

/// Create a copy of AuthResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(OnError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
