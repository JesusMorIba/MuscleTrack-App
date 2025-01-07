import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:muscle_track/common/common.dart';

part 'signup_state.freezed.dart';

enum SignupEvent { none, success, error }

@freezed
class SignupState with _$SignupState {
  factory SignupState({
    @Default(false) bool isFormPosted,
    @Default(false) bool isValid,
    @Default(false) bool isLoading,
    @Default(Email.pure()) Email email,
    @Default(Password.pure()) Password password,
    String? error,
    @Default(SignupEvent.none) SignupEvent event,
  }) = _SignupState;
}
