import 'package:alert_info/alert_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:muscle_track/common/widgets/custom_login_with_button.dart';
import 'package:muscle_track/core/core.dart';
import 'package:muscle_track/common/common.dart';
import 'package:muscle_track/features/signup/presentation/provider/signup_provider.dart';
import 'package:muscle_track/features/signup/presentation/state/signup_state.dart';

class SignupForm extends ConsumerWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<SignupState>(signupProvider, (previous, next) {
      switch (next.event) {
        case SignupEvent.success:
          AlertInfo.show(
            context: context,
            text: 'Signup success',
            typeInfo: TypeInfo.success,
          );
          context.go('/walkthrough');
          break;

        case SignupEvent.error:
          AlertInfo.show(
            context: context,
            text: next.error!,
            typeInfo: TypeInfo.error,
          );
          break;

        case SignupEvent.none:
          break;
      }

      if (next.event != SignupEvent.none) {
        ref.read(signupProvider.notifier).clearEvent();
      }
    });

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: SizedBox(
            child: _signupForm(context, ref),
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context, ref),
      ),
    );
  }

  Widget _signupForm(BuildContext context, WidgetRef ref) {
    final signupForm = ref.watch(signupProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: kExtraLarge),
          Text(
            'Create Your Account 👤',
            style: AppTextStyles.heading3(color: AppColors.black),
          ),
          const SizedBox(height: kLarge),
          Text(
            'Sign up now to get access to personalized workouts and achieve your fitness goals.',
            style: AppTextStyles.bodyXLargeRegular(color: AppColors.black),
            maxLines: 2,
          ),
          const SizedBox(height: kExtraLarge),
          CustomTextFormField(
            label: 'Email',
            hintText: 'Email',
            onChanged: ref.read(signupProvider.notifier).onEmailChange,
            errorMessage:
                signupForm.isFormPosted ? signupForm.email.errorMessage : null,
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
            onChanged: ref.read(signupProvider.notifier).onPasswordChange,
            errorMessage: signupForm.isFormPosted
                ? signupForm.password.errorMessage
                : null,
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
                'Already have an account?',
                style: AppTextStyles.bodyXLargeRegular(color: AppColors.dark1),
              ),
              TextButton(
                onPressed: () => context.push('/login'),
                child: Text(
                  'Log in',
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
            isLoading: ref.read(signupProvider).isLoading,
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
            isLoading: ref.read(signupProvider).isLoading,
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
            isLoading: ref.read(signupProvider).isLoading,
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
      text: 'Sign up ',
      size: ButtonSize.large,
      isLoading: ref.read(signupProvider).isLoading,
      buttonDesign: ButtonDesign.primary,
      onPressed: () {
        ref.read(signupProvider.notifier).onFormSubmit();
      },
    ),
  );
}
