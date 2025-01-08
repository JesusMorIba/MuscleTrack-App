import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:muscle_track/common/common.dart';

part 'login_state.freezed.dart';

enum LoginEvent { none, success, error }

@freezed
class LoginState with _$LoginState {
  factory LoginState({
    @Default(false) bool isFormPosted,
    @Default(false) bool isValid,
    @Default(false) bool isLoading,
    @Default(Email.pure()) Email email,
    @Default(Password.pure()) Password password,
    String? error,
    @Default(LoginEvent.none) LoginEvent event,
  }) = _LoginState;
}
