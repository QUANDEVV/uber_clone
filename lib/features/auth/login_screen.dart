import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'signup_screen.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _pinController = TextEditingController();
  String _selectedCountryCode = '+254';
  bool _showPin = false;

  @override
  void dispose() {
    _phoneController.dispose();
    _pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Cutting-edge Brand Design
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    // Modern Icon Design
                    Transform.rotate(
                      angle: -0.2,
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(8),
                            bottomLeft: Radius.circular(8),
                            bottomRight: Radius.circular(24),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primary.withOpacity(0.3),
                              offset: Offset(5, 5),
                              blurRadius: 20,
                            ),
                          ],
                        ),
                        child: Transform.rotate(
                          angle: 0.2,
                          child: Icon(
                            Icons.bolt,
                            color: AppColors.primary,
                            size: 40,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Modern Typography
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'lér',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w300,
                              color: Colors.black87,
                              letterSpacing: -1,
                            ),
                          ),
                          TextSpan(
                            text: 'one',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primary,
                              letterSpacing: -1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4),
                    
                  ],
                ),
              ),

              const SizedBox(height: 10),

            
              
              // Sign in text
              Text(
                'Please sign in to continue',
                style: AppTextStyles.bodySmall.copyWith(
                  color: Colors.black45,
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 32),
              
              // Phone Number Input
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.grey[200]!,
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 130,
                      child: CountryCodePicker(
                        onChanged: (CountryCode code) {
                          setState(() {
                            _selectedCountryCode = code.dialCode ?? '+254';
                          });
                        },
                        initialSelection: 'KE',
                        favorite: const ['KE'],
                        showCountryOnly: false,
                        showOnlyCountryWhenClosed: false,
                        alignLeft: false,
                        textStyle: AppTextStyles.body.copyWith(
                          color: Colors.black38,
                        ),
                        dialogTextStyle: AppTextStyles.body.copyWith(
                          color: Colors.black38,
                        ),
                      ),
                    ),
                    Container(
                      width: 1,
                      height: 32,
                      color: Colors.grey[200],
                    ),
                    Expanded(
                      child: TextField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        style: AppTextStyles.body.copyWith(
                          color: Colors.black87,
                        ),
                        decoration: InputDecoration(
                          hintText: '711 111 111',
                          hintStyle: AppTextStyles.body.copyWith(
                            color: Colors.black38,
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 16),
              
              // Get OTP Button
              ElevatedButton(
                onPressed: () {
                  setState(() => _showPin = true);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Get OTP Code',
                  style: AppTextStyles.button,
                ),
              ),
              
              if (_showPin) ...[
                const SizedBox(height: 24),
                
                // PIN Input
                Pinput(
                  length: 4,
                  defaultPinTheme: PinTheme(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.grey[200]!,
                      ),
                    ),
                    textStyle: AppTextStyles.h3.copyWith(
                      color: Colors.black87,
                    ),
                  ),
                ),
                
                const SizedBox(height: 16),
                
                // Verify Button
               
              ],
              
              const SizedBox(height: 24),
              
              // Sign Up Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: AppTextStyles.bodySmall.copyWith(
                      color: Colors.black45,
                    ),
                  ),
                  TextButton(
                    onPressed: () => Get.to(() => const SignUpScreen()),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      'Sign up',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
