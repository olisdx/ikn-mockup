import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../../common/button/primary_button.dart';
import '../../../common/field/password_field.dart';
import '../../../common/field/phone_field.dart';
import '../../../common/field/textdef_field.dart';
import '../../../common/widget/backdrop_body_loading.dart';
import '../../../common/widget/data_bottom_sheet.dart';
import '../../../configs/theme.dart';
import '../widget/header_auth.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool _isLoading = false;

  Future<void> _onRegistrationAccount() async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(milliseconds: 1000));
    setState(() => _isLoading = false);
    if (!mounted) return;

    DataBottomSheet.instance.show(
      context: context,
      title: "Registrasi Berhasil",
      description:
          "Selamat datang, lanjutkan untuk masuk ke dalam aplikasi kami",
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    const HeaderAuth(
                      title: "Pendaftaran Akun",
                      description: "Daftarkan akun Anda",
                    ),
                    Positioned(
                      left: 24,
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
                _FormRegistration(_onRegistrationAccount),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FormRegistration extends StatefulWidget {
  const _FormRegistration(this.onTap);
  final Function() onTap;

  @override
  State<_FormRegistration> createState() => __FormRegistrationState();
}

class __FormRegistrationState extends State<_FormRegistration> {
  final _emailController = TextEditingController();
  final _nikController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
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
            textController: _nikController,
            hintText: "NIK",
            keyboardType: TextInputType.number,
            maxLength: 16,
          ),
          const SizedBox(height: 24),
          TextDefField(
            textController: _nameController,
            hintText: "Nama",
            keyboardType: TextInputType.name,
          ),
          const SizedBox(height: 24),
          TextDefField(
            textController: _emailController,
            hintText: "Email",
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 24),
          PhoneField(textController: _phoneController),
          const SizedBox(height: 24),
          PasswordField(textController: _passwordController),
          const SizedBox(height: 24),
          PasswordField(
            textController: _confirmPasswordController,
            hintText: "Konfirmasi Password",
          ),
          const SizedBox(height: 34),
          PrimaryButton(
            text: "Daftar",
            onTap: widget.onTap,
          ),
        ],
      ),
    );
  }
}
