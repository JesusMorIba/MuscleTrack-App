import 'package:alert_info/alert_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:muscle_track/common/widgets/custom_login_with_button.dart';
import 'package:muscle_track/core/core.dart';
import 'package:muscle_track/common/common.dart';
import 'package:muscle_track/features/login/presentation/provider/login_provider.dart';
import 'package:muscle_track/features/login/presentation/state/login_state.dart';

class LoginForm extends ConsumerWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<LoginState>(loginProvider, (previous, next) {
      switch (next.event) {
        case LoginEvent.success:
          AlertInfo.show(
            context: context,
            text: 'Login success',
            typeInfo: TypeInfo.success,
          );
          context.go('/home');
          break;

        case LoginEvent.error:
          AlertInfo.show(
            context: context,
            text: next.error!,
            typeInfo: TypeInfo.error,
          );
          break;

        case LoginEvent.none:
          break;
      }

      if (next.event != LoginEvent.none) {
        ref.read(loginProvider.notifier).clearEvent();
      }
    });

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: SizedBox(
            child: _loginForm(context, ref),
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context, ref),
      ),
    );
  }

  Widget _loginForm(BuildContext context, WidgetRef ref) {
    final loginForm = ref.watch(loginProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: kExtraLarge),
          Text(
            'Welcome Back! 👋',
            style: AppTextStyles.heading3(color: AppColors.black),
          ),
          const SizedBox(height: kLarge),
          Text(
            'Sign in to access your personalized workouts and track your progress.',
            style: AppTextStyles.bodyXLargeRegular(color: AppColors.black),
            maxLines: 2,
          ),
          const SizedBox(height: kExtraLarge),
          CustomTextFormField(
            label: 'Email',
            hintText: 'Email',
            onChanged: ref.read(loginProvider.notifier).onEmailChange,
            errorMessage:
                loginForm.isFormPosted ? loginForm.email.errorMessage : null,
            leftIcon: SvgPicture.asset(
              'assets/icons/email.svg',
              width: 18,
              height: 16,
              fit: BoxFit.none,
            ),
          ),
          const SizedBox(height: kLarge),
          CustomTextFormField(
            label: 'Password',
            hintText: 'Password',
            onChanged: ref.read(loginProvider.notifier).onPasswordChange,
            errorMessage:
                loginForm.isFormPosted ? loginForm.password.errorMessage : null,
            leftIcon: SvgPicture.asset(
              'assets/icons/lock.svg',
              width: 14,
              height: 17,
              fit: BoxFit.none,
            ),
            obscureText: true,
          ),
          const SizedBox(height: kLarge),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Dont have an account?',
                style: AppTextStyles.bodyXLargeRegular(color: AppColors.dark1),
              ),
              TextButton(
                onPressed: () => context.push('/signup'),
                child: Text(
                  'Sign up',
                  style: AppTextStyles.bodyXLargeSemiBold(
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: kLarge),
          CustomLoginWithButton(
            text: 'Continue with Google',
            leftIcon: SvgPicture.asset(
              'assets/icons/google.svg',
              width: 24,
              height: 24,
            ),
            onPressed: () {},
          ),
          const SizedBox(height: kLarge),
          CustomLoginWithButton(
            text: 'Continue with Apple',
            leftIcon: SvgPicture.asset(
              'assets/icons/apple.svg',
              width: 24,
              height: 24,
            ),
            onPressed: () {},
          ),
          const SizedBox(height: kLarge),
          CustomLoginWithButton(
            text: 'Continue with Facebook',
            leftIcon: SvgPicture.asset(
              'assets/icons/facebook.svg',
              width: 24,
              height: 24,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

Widget _buildBottomBar(BuildContext context, WidgetRef ref) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(12),
    decoration: const BoxDecoration(
      color: AppColors.white,
      border: Border(
        top: BorderSide(color: AppColors.grey100, width: 1),
      ),
    ),
    child: CustomElevatedButton(
      text: 'Log in',
      size: ButtonSize.large,
      isLoading: ref.read(loginProvider).isLoading,
      buttonDesign: ButtonDesign.primary,
      onPressed: () {
        ref.read(loginProvider.notifier).onFormSubmit();
      },
    ),
  );
}
