import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:reusables/mixins/form_state_mixin.dart';
import 'package:zeepalm_assessment/src/const/assets.dart';
import 'package:zeepalm_assessment/src/features/auth/views/sign_in_screen.dart';
import 'package:zeepalm_assessment/src/features/auth/widgets/heading.dart';
import 'package:zeepalm_assessment/src/util/extensions/size_extension.dart';
import 'package:zeepalm_assessment/src/widgets/app_textfield.dart';

import '../../../const/colors.dart';
import '../../../services/auth_service.dart';
import '../../../widgets/app_bar.dart';
import '../../../widgets/primary_button.dart';
import '../widgets/helper_text.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen.builder(
    BuildContext context,
    GoRouterState state, {
    super.key,
  });

  static const String path = '/signUp';
  static const String name = 'signup';

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen>
    with FormStateMixin {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _signUp() async {
    setState(() => _isLoading = true);
    try {
      await ref.read(authServiceProvider).signUpWithEmailAndPassword(
            _emailController.text.trim(),
            _passwordController.text.trim(),
          );
      if (mounted) {
        context.goNamed(SignInScreen.name);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(e.toString())));
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryScaffoldBg,
      appBar: const AppBarWidget(
        title: "Sign Up",
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
          child: Form(
            autovalidateMode: autovalidateMode,
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  AppAssets.logo,
                  width: 100,
                  height: 100,
                  fit: BoxFit.scaleDown,
                ),
                25.height,
                const HeadingText(text: "Email"),
                6.height,
                AppTextField(
                  hint: "Enter Email",
                  textEditingController: _emailController,
                  keyboardType: TextInputType.emailAddress,
                ),
                16.height,
                const HeadingText(text: "Password"),
                6.height,
                AppPasswordField(
                  textEditingController: _passwordController,
                  hint: "Enter Password",
                ),
                16.height,
                const HeadingText(text: "Confirm Password"),
                6.height,
                AppPasswordField(
                  textEditingController: _confirmPasswordController,
                  hint: "Enter Confirm Password",
                ),
                24.height,
                AppButton(
                    onPressed: _signUp,
                    text: _isLoading ? "Please Wait" : "Sign Up"),
                20.height,
                HelperText(
                  text: "Already have an account?  ",
                  linkText: "Sign In",
                  onTap: () {
                    context.pushNamed(SignInScreen.name);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
