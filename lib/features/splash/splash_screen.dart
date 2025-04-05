import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import '../../core/services/storage_service.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../auth/login_screen.dart';
import '../home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _showElements = false;
  String _subtitle = '';
  final List<bool> _showLetters = List.generate(5, (_) => false); // "LERON" has 5 letters

  @override
  void initState() {
    super.initState();
    _startAnimation();
    _fetchSubtitle();
  }

  // Mock API call to fetch subtitle
  Future<void> _fetchSubtitle() async {
    await Future.delayed(const Duration(milliseconds: 800));
    if (!mounted) return;
    setState(() {
      _subtitle = 'Ride Green Ride Clean';
    });
  }

  Future<void> _startAnimation() async {
    // Animate letters one by one
    for (int i = 0; i < _showLetters.length; i++) {
      await Future.delayed(const Duration(milliseconds: 150));
      if (!mounted) return;
      setState(() {
        _showLetters[i] = true;
      });
    }

    // Show subtitle and other elements
    await Future.delayed(const Duration(milliseconds: 500));
    if (!mounted) return;
    setState(() => _showElements = true);

    // Navigate based on auth status after animation
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    
    // Check if user is logged in
    if (StorageService.hasToken()) {
      Get.off(() => const HomeScreen());
    } else {
      Get.off(() => const LoginScreen());
      
    }
  }

  Widget _buildAnimatedLetter(String letter, int index) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 300),
      opacity: _showLetters[index] ? 1.0 : 0.0,
      child: AnimatedSlide(
        duration: const Duration(milliseconds: 300),
        offset: _showLetters[index] ? Offset.zero : const Offset(0, 0.5),
        child: Text(
          letter,
          style: AppTextStyles.splashTitle.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // Animated gradient background
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.gradientStart,
                    AppColors.gradientEnd,
                  ],
                ),
              ),
            ),
          ),

          // Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Animated letters for "LERON"
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildAnimatedLetter('L', 0),
                    _buildAnimatedLetter('E', 1),
                    _buildAnimatedLetter('R', 2),
                    _buildAnimatedLetter('O', 3),
                    _buildAnimatedLetter('N', 4),
                  ],
                ),

                const SizedBox(height: 16),
                
                // Subtitle with fade animation
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  opacity: _showElements ? 1.0 : 0.0,
                  child: Text(
                    _subtitle,
                    style: AppTextStyles.splashSubtitle.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
