import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lung_cancer_detection_ui/pages/prediction_page/prediction_page.dart';
import 'package:lung_cancer_detection_ui/services/auth_service.dart';
import 'package:lung_cancer_detection_ui/services/image_pick_service.dart';

import '../../utils/ui_utils.dart';
import '../../widgets/underline_on_hover_text_button.dart';
import 'widgets/admin_login_dialog.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.centerLeft,
        children: [
          _buildBackgroundImage(),
          Positioned(
            left: UiUtils.getPercentageWidth(context, 8),
            child: Column(
              children: [
                _buildAppTitle(),
                const SizedBox(
                  height: 32,
                ),
                _buildProceedButton(context),
              ],
            ),
          ),
          Positioned(
            left: UiUtils.getPercentageWidth(context, 3),
            top: UiUtils.getPercentageHeight(context, 2),
            child: SizedBox(
              width: UiUtils.getPercentageWidth(context, 94),
              height: UiUtils.getPercentageHeight(context, 5),
              child: _buildMenu(context),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMenu(BuildContext context) {
    return StreamBuilder<User?>(
        stream: AuthService.instance.authStateChanges,
        builder: (context, snapshot) {
          final isAdminLoggedIn = snapshot.data != null;
          return Row(
            children: [
              if (!isAdminLoggedIn)
                _buildMenuButton(
                  context,
                  label: "ADMIN LOGIN",
                  onPressed: () async {
                    await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AdminLoginDialog();
                      },
                    );
                  },
                ),
              if (isAdminLoggedIn)
                _buildMenuButton(
                  context,
                  label: "ADMIN LOGOUT",
                  onPressed: () async {
                    await AuthService.instance.logout();
                  },
                ),
            ],
          );
        });
  }

  Widget _buildMenuButton(BuildContext context,
      {required String label, required VoidCallback onPressed}) {
    return BorderOnHoverWidget(
      border: const Border(bottom: BorderSide(color: Colors.white, width: 1)),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          textStyle: GoogleFonts.courierPrime(fontSize: 16),
          padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 18, vertical: 24),
        ),
        child: Text(
          label,
        ),
      ),
    );
  }

  Widget _buildProceedButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await onProceedClicked(context);
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.white10,
        textStyle: GoogleFonts.courierPrime(fontSize: 21),
        padding:
            const EdgeInsetsDirectional.symmetric(horizontal: 32, vertical: 24),
      ),
      child: Text(
        "Proceed".toUpperCase(),
      ),
    );
  }

  Future<void> onProceedClicked(BuildContext context) async {
    final imgEncoding = await ImagePickService.pickImageAsBase64String();
    if (imgEncoding != null && context.mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PredictionPage(
            imageBase64Encoding: imgEncoding,
          ),
        ),
      );
    }
  }

  Widget _buildAppTitle() {
    return const Text(
      "Lung Cancer Detection",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontSize: 56,
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return Image.asset(
      "assets/background/landing_page_bg.jpeg",
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }
}
