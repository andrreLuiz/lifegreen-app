import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:greengrocer/src/models/user_model.dart';

part 'auth_result.freezed.dart';

@freezed
sealed class AuthResult with _$AuthResult {
  factory AuthResult.success(UserModel user) = OnSuccess;
  factory AuthResult.error(String message) = OnError;

  void when({
    required Null Function(dynamic user) success,
    required Null Function(dynamic message) error,
  }) {}
}
