import 'package:flutter/material.dart';

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
            left: 150,
            child: Column(
              children: [
                _buildAppTitle(),
                const SizedBox(
                  height: 32,
                ),
                _buildProceedButton(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildProceedButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.white10,
        textStyle: const TextStyle(
          fontSize: 18,
        ),
        padding:
            const EdgeInsetsDirectional.symmetric(horizontal: 32, vertical: 24),
      ),
      child: Text(
        "Proceed".toUpperCase(),
      ),
    );
  }

  Widget _buildAppTitle() {
    return const Text(
      "Lung Cancer Detection",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontSize: 48,
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
