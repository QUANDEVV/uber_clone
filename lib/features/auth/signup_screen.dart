import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:uber_clone/core/theme/app_colors.dart';
import 'package:uber_clone/core/theme/app_text_styles.dart';
import 'package:uber_clone/features/vehicle/vehicle_selection_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  String _selectedCountryCode = '+254';
  bool _emailVerified = false;
  bool _phoneVerified = false;

  void _showVerificationSheet({required bool isEmail}) {
    final controller = TextEditingController();
    Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                isEmail ? 'Verify Email' : 'Verify Phone Number',
                style: AppTextStyles.h3.copyWith(
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                isEmail 
                  ? 'Enter the 4-digit code sent to your email'
                  : 'Enter the 4-digit code sent to your phone',
                style: AppTextStyles.bodySmall.copyWith(
                  color: Colors.black45,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Pinput(
                length: 4,
                controller: controller,
                defaultPinTheme: PinTheme(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey[200]!),
                  ),
                  textStyle: AppTextStyles.h3.copyWith(
                    color: Colors.black87,
                  ),
                ),
                focusedPinTheme: PinTheme(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.primary),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.1),
                        blurRadius: 8,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  textStyle: AppTextStyles.h3.copyWith(
                    color: Colors.black87,
                  ),
                ),
                onCompleted: (pin) {
                  // TODO: Verify OTP
                  setState(() {
                    if (isEmail) {
                      _emailVerified = true;
                    } else {
                      _phoneVerified = true;
                    }
                  });
                  Get.back();
                },
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  // TODO: Implement resend code
                },
                child: Text(
                  'Resend Code',
                  style: AppTextStyles.button.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
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
                    Text(
                      'premium rides',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black45,
                        letterSpacing: 4,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              Text(
                'Sign up',
                style: AppTextStyles.h2.copyWith(
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 10),

              // First and Last Name
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey[200]!),
                      ),
                      child: TextField(
                        controller: _firstNameController,
                        style: AppTextStyles.body.copyWith(color: Colors.black87),
                        decoration: InputDecoration(
                          hintText: 'First name',
                          hintStyle: AppTextStyles.body.copyWith(color: Colors.black38),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.all(16),
                          prefixIcon: Icon(Icons.person_outline, color: Colors.grey[400]),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey[200]!),
                      ),
                      child: TextField(
                        controller: _lastNameController,
                        style: AppTextStyles.body.copyWith(color: Colors.black87),
                        decoration: InputDecoration(
                          hintText: 'Last name',
                          hintStyle: AppTextStyles.body.copyWith(color: Colors.black38),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.all(16),
                          prefixIcon: Icon(Icons.person_outline, color: Colors.grey[400]),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Email Input
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey[200]!),
                ),
                child: TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  style: AppTextStyles.body.copyWith(color: Colors.black87),
                  decoration: InputDecoration(
                    hintText: 'E-mail',
                    hintStyle: AppTextStyles.body.copyWith(color: Colors.black38),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.all(16),
                    prefixIcon: Icon(Icons.email_outlined, color: Colors.grey[400]),
                    suffixIcon: _emailVerified
                        ? Icon(Icons.check_circle, color: Colors.green[400])
                        : null,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Phone Number Input
              Container(
                height: 56,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Country Code
                    Container(
                      height: 56,
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
                        padding: EdgeInsets.zero,
                        textStyle: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Container(
                      width: 1,
                      height: 24,
                      color: Colors.black12,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                    ),
                    // Phone Input
                    Expanded(
                      child: TextFormField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Phone number',
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 18,
                          ),
                          isDense: true,
                          suffixIcon: _phoneVerified
                              ? Container(
                                  margin: const EdgeInsets.only(right: 12),
                                  child: Icon(
                                    Icons.check_circle,
                                    color: Colors.green[400],
                                    size: 20,
                                  ),
                                )
                              : null,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              // Verify Inputs Button
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (!_emailVerified) {
                      _showVerificationSheet(isEmail: true);
                    } else if (!_phoneVerified) {
                      _showVerificationSheet(isEmail: false);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                    minimumSize: const Size(double.infinity, 56),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        !_emailVerified ? Icons.email : !_phoneVerified ? Icons.phone_android : Icons.check_circle,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        !_emailVerified
                            ? 'Verify Email'
                            : !_phoneVerified
                                ? 'Verify Phone'
                                : 'All Verified',
                        style: AppTextStyles.button,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Sign Up Button
              ElevatedButton(
                onPressed: _emailVerified && _phoneVerified
                    ? () {
                        // Navigate to vehicle selection
                        Get.off(() => const VehicleSelectionScreen());
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                  disabledBackgroundColor: Colors.grey[300],
                ),
                child: Text(
                  'Sign Up',
                  style: AppTextStyles.button,
                ),
              ),

              const SizedBox(height: 24),

              // Sign In Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: AppTextStyles.bodySmall.copyWith(color: Colors.black45),
                  ),
                  TextButton(
                    onPressed: () => Get.back(),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      'Sign in',
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