import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../../common/button/primary_button.dart';
import '../../../common/button/secondary_button.dart';
import '../../../common/field/password_field.dart';
import '../../../common/field/textdef_field.dart';
import '../../../common/widget/backdrop_body_loading.dart';
import '../../../configs/theme.dart';
import '../../../gen/assets.gen.dart';
import '../widget/header_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;

  Future<void> _onLogin() async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(milliseconds: 1000));
    setState(() => _isLoading = false);
    if (!mounted) return;
    context.goNamed(AppStrings.homeRoute);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.dark,
        body: BackdropBodyLoading(
          isLoading: _isLoading,
          child: Column(
            children: [
              const HeaderAuth(
                title: "Masuk ke Akun\nAnda",
                description: "Masukkan data diri akun Anda",
              ),
              _FormSignIn(_onLogin),
            ],
          ),
        ),
      ),
    );
  }
}

class _FormSignIn extends StatefulWidget {
  const _FormSignIn(this.onLogin);

  final Function() onLogin;

  @override
  State<_FormSignIn> createState() => __FormSignInState();
}

class __FormSignInState extends State<_FormSignIn> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.fromLTRB(24, 34, 24, 24),
        decoration: const BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Column(
          children: [
            TextDefField(
              textController: _emailController,
              hintText: "Email",
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 24),
            PasswordField(textController: _passwordController),
            const SizedBox(height: 24),
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () => context.goNamed(AppStrings.forgotPasswordRoute),
                child: Text(
                  "Lupa Password?",
                  style: Typograph.buttonSubtitle
                      .copyWith(color: AppColors.secondary),
                ),
              ),
            ),
            const SizedBox(height: 24),
            PrimaryButton(
              text: "Masuk",
              onTap: widget.onLogin,
            ),
            const SizedBox(height: 34),
            const Row(
              children: [
                Flexible(
                  child: Divider(
                    color: AppColors.shade,
                  ),
                ),
                SizedBox(width: 12),
                Text(
                  "Atau\nmasuk dengan",
                  style: Typograph.textRegular,
                  textAlign: TextAlign.center,
                ),
                SizedBox(width: 12),
                Flexible(child: Divider(color: AppColors.shade)),
              ],
            ),
            const SizedBox(height: 34),
            Row(
              children: [
                Flexible(
                  child: SecondaryButton(
                    secondaryButtonType: SecondaryButtonType.icon,
                    text: "Google",
                    icon: Assets.images.googleIcon.path,
                    onTap: () {},
                  ),
                ),
                const SizedBox(width: 16),
                Flexible(
                  child: SecondaryButton(
                    secondaryButtonType: SecondaryButtonType.icon,
                    text: "Tamu",
                    icon: Assets.images.guestIcon.path,
                    onTap: () => context.goNamed(AppStrings.homeRoute),
                  ),
                ),
              ],
            ),
            const Spacer(),
            RichText(
              text: TextSpan(
                style: Typograph.textRegular,
                children: [
                  const TextSpan(
                    text: "Belum punya akun? ",
                  ),
                  TextSpan(
                    text: "Daftar",
                    style: Typograph.textRegular.copyWith(
                      color: AppColors.secondary,
                      fontWeight: FontWeight.w600,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () =>
                          context.goNamed(AppStrings.registrationAccountRoute),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
