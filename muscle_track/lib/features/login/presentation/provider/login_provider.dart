import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:muscle_track/common/inputs/email.dart';
import 'package:muscle_track/common/inputs/password.dart';
import 'package:muscle_track/core/provider/auth_state_provider.dart';
import 'package:muscle_track/features/login/application/login_service_impl.dart';
import 'package:muscle_track/features/login/data/dto/dto.dart';
import 'package:muscle_track/features/login/presentation/state/login_state.dart';

//! 1 - StateNotifierProvider
final loginProvider =
    AutoDisposeNotifierProvider<LoginNotifier, LoginState>((LoginNotifier.new));

//! 2 - Notifier
class LoginNotifier extends AutoDisposeNotifier<LoginState> {
  @override
  LoginState build() {
    return LoginState();
  }

  onEmailChange(String value) {
    final newEmail = Email.dirty(value);
    state = state.copyWith(
        email: newEmail, isValid: Formz.validate([newEmail, state.password]));
  }

  onPasswordChange(String value) {
    final newPassword = Password.dirty(value);
    state = state.copyWith(
        password: newPassword,
        isValid: Formz.validate([newPassword, state.email]));
  }

  onFormSubmit() async {
    _touchEveryField();

    if (!state.isValid) return;

    state = state.copyWith(isLoading: true);

    await login();

    state = state.copyWith(isLoading: false);
  }

  _touchEveryField() {
    final email = Email.dirty(state.email.value);
    final password = Password.dirty(state.password.value);

    state = state.copyWith(
        isFormPosted: true,
        email: email,
        password: password,
        isValid: Formz.validate([email, password]));
  }

  clearEvent() {
    state = state.copyWith(event: LoginEvent.none);
  }

  Future<void> login() async {
    try {
      // update the state - isLoading = true and error = null
      state = state.copyWith(event: LoginEvent.none, error: null);

      // setup the login request - email and password from the form
      final loginRequest = LoginRequest(
        email: state.email.value,
        password: state.password.value,
      );

      // call login api
      final result = await ref.read(loginServiceProvider).login(loginRequest);

      result.when((succes) {
        // update the auth state
        ref.invalidate(authStateProvider);
        ref.read(authStateProvider.notifier).setAuthState(succes);

        // update the state - isLoading = false and isLoginSuccess = response
        state = state.copyWith(event: LoginEvent.success);
      }, (failure) {
        state = state.copyWith(event: LoginEvent.error, error: failure.message);
      });
    } catch (e) {
      state = state.copyWith(event: LoginEvent.error, error: e.toString());
    }
  }
}
