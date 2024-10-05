import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../../common/button/primary_button.dart';
import '../../../common/field/textdef_field.dart';
import '../../../common/widget/backdrop_body_loading.dart';
import '../../../common/widget/data_bottom_sheet.dart';
import '../../../configs/theme.dart';
import '../widget/header_auth.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  bool _isLoading = false;

  Future<void> _onForgotPassword() async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(milliseconds: 1000));
    setState(() => _isLoading = false);
    if (!mounted) return;

    DataBottomSheet.instance.show(
      context: context,
      title: "Perubahan Berhasil",
      description: "Cek email anda dan ikuti instruksi selanjutnya",
      onTap: () => context.goNamed(AppStrings.homeRoute),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: AppColors.dark,
        body: BackdropBodyLoading(
          isLoading: _isLoading,
          child: Column(
            children: [
              Stack(
                children: [
                  const HeaderAuth(
                    title: "Lupa Password",
                    description: "Masukkan email untuk merubah password",
                  ),
                  Positioned(
                    left: 16,
                    top: 34,
                    child: InkWell(
                      onTap: () => context.pop(),
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              _FormForgotPassword(_onForgotPassword),
            ],
          ),
        ),
      ),
    );
  }
}

class _FormForgotPassword extends StatefulWidget {
  const _FormForgotPassword(this.onTap);

  final Function() onTap;

  @override
  State<_FormForgotPassword> createState() => __FormForgotPasswordState();
}

class __FormForgotPasswordState extends State<_FormForgotPassword> {
  final _emailController = TextEditingController();

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextDefField(
              textController: _emailController,
              hintText: "Email",
              keyboardType: TextInputType.emailAddress,
            ),
            PrimaryButton(onTap: widget.onTap),
          ],
        ),
      ),
    );
  }
}
