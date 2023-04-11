import 'package:flutter/material.dart';
import 'package:lung_cancer_detection_ui/utils/ui_utils.dart';

class AdminLoginDialog extends StatelessWidget {
  AdminLoginDialog({
    super.key,
  });

  final _loginFormKey = GlobalKey<FormState>();
  final _emailValueController = TextEditingController();
  final _passwordValueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: SizedBox(
        width: UiUtils.getPercentageWidth(context, 25),
        child: const Center(
          child: Text(
            "ADMIN LOGIN",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 21, horizontal: 24),
      titlePadding: const EdgeInsets.symmetric(vertical: 21, horizontal: 24),
      children: [
        _buildLoginForm(),
        const SizedBox(height: 32),
        _buildLoginButton(),
      ],
    );
  }

  Widget _buildLoginForm() {
    return Form(
      key: _loginFormKey,
      child: Column(
        children: [
          _buildEmailFormField(),
          const SizedBox(height: 24),
          _buildPasswordFormField(),
        ],
      ),
    );
  }

  Widget _buildPasswordFormField() {
    return TextFormField(
      controller: _passwordValueController,
      obscureText: true,
      decoration: const InputDecoration(
        hintText: "Password",
        labelText: "Enter Password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Password cannot be empty";
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  Widget _buildEmailFormField() {
    return TextFormField(
      controller: _emailValueController,
      decoration: const InputDecoration(
        hintText: "Email",
        labelText: "Enter Email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Email cannot be empty";
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: () {
        onLoginClicked();
      },
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          "LOGIN",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  void onLoginClicked() {
    final loginFormCurrentState = _loginFormKey.currentState;
    if (loginFormCurrentState != null && loginFormCurrentState.validate()) {
      loginFormCurrentState.save();
    }
  }
}
