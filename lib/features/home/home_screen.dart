import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'Leron',
          style: AppTextStyles.h2.copyWith(
            color: AppColors.textPrimary,
            letterSpacing: -0.5,
          ),
        ),
        backgroundColor: AppColors.card,
        elevation: 0,
      ),
      body: Center(
        child: Text(
          'Welcome to Leron',
          style: AppTextStyles.body.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
      ),
    );
  }
}
