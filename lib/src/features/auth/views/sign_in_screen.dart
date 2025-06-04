import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:zeepalm_assessment/src/const/colors.dart';
import 'package:zeepalm_assessment/src/features/auth/views/sign_up_screen.dart';
import 'package:zeepalm_assessment/src/features/auth/widgets/heading.dart';
import 'package:zeepalm_assessment/src/features/home/views/video_feed_screen.dart';
import 'package:zeepalm_assessment/src/util/extensions/size_extension.dart';
import 'package:zeepalm_assessment/src/widgets/app_bar.dart';
import 'package:zeepalm_assessment/src/widgets/app_textfield.dart';
import 'package:zeepalm_assessment/src/widgets/primary_button.dart';

import '../../../const/assets.dart';
import '../../../services/auth_service.dart';
import '../widgets/helper_text.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen.builder(
    BuildContext context,
    GoRouterState state, {
    super.key,
  });

  static const String path = '/signIn';
  static const String name = 'signin';

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signIn() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      try {
        await ref.read(authServiceProvider).signInWithEmailAndPassword(
              _emailController.text.trim(),
              _passwordController.text.trim(),
            );
        setState(() {
          TextInput.finishAutofillContext(
            shouldSave: true,
          );
        });
        if (mounted) {
          context.goNamed(VideoFeedScreen.name);
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryScaffoldBg,
      appBar: const AppBarWidget(
        title: "Sign In",
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: AutofillGroup(
            child: Form(
              key: _formKey,
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
                    textEditingController: _emailController,
                    hint: "Enter Email",
                    keyboardType: TextInputType.emailAddress,
                    autofillHints: const [AutofillHints.email],
                  ),
                  16.height,
                  const HeadingText(text: "Password"),
                  6.height,
                  AppPasswordField(
                    autofillHints: const [AutofillHints.password],
                    textEditingController: _passwordController,
                    hint: "Enter Password",
                  ),
                  24.height,
                  AppButton(
                      onPressed: _signIn,
                      text: _isLoading ? "Please Wait" : "Sign In"),
                  20.height,
                  HelperText(
                    text: "Don'\t have an account?  ",
                    linkText: "Sign Up",
                    onTap: () {
                      context.pushNamed(SignUpScreen.name);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
