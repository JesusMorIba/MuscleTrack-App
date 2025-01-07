import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:muscle_track/common/inputs/email.dart';
import 'package:muscle_track/common/inputs/password.dart';
import 'package:muscle_track/core/provider/auth_state_provider.dart';
import 'package:muscle_track/features/signup/application/signup_service_impl.dart';
import 'package:muscle_track/features/signup/data/dto/request/signup_request.dart';
import 'package:muscle_track/features/signup/presentation/state/signup_state.dart';

//! 1 - StateNotifierProvider
final signupProvider = AutoDisposeNotifierProvider<SignupNotifier, SignupState>(
    (SignupNotifier.new));

//! 2 - Notifier
class SignupNotifier extends AutoDisposeNotifier<SignupState> {
  @override
  SignupState build() {
    return SignupState();
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
    state = state.copyWith(event: SignupEvent.none);
  }

  Future<void> login() async {
    try {
      // update the state - isLoading = true and error = null
      state = state.copyWith(event: SignupEvent.none, error: null);

      // setup the login request - email and password from the form
      final signupRequest = SignupRequest(
        email: state.email.value,
        password: state.password.value,
      );

      // call login api
      final result =
          await ref.read(signupServiceProvider).signup(signupRequest);

      result.when((succes) {
        // update the auth state
        ref.invalidate(authStateProvider);
        ref.read(authStateProvider.notifier).setAuthState(succes);

        // update the state - isLoading = false and isSignupSuccess = response
        state = state.copyWith(event: SignupEvent.success);
      }, (failure) {
        state =
            state.copyWith(event: SignupEvent.error, error: failure.message);
      });
    } catch (e) {
      state = state.copyWith(event: SignupEvent.error, error: e.toString());
    }
  }
}
