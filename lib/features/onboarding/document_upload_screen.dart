import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uber_clone/core/theme/app_colors.dart';
import 'package:uber_clone/core/theme/app_text_styles.dart';
import 'package:uber_clone/features/onboarding/get_started_screen.dart';

class DocumentUploadScreen extends StatefulWidget {
  const DocumentUploadScreen({super.key});

  @override
  State<DocumentUploadScreen> createState() => _DocumentUploadScreenState();
}

class _DocumentUploadScreenState extends State<DocumentUploadScreen> {
  int _currentStep = 0;
  final _steps = [
    "National ID",
    "Driver's License",
    "Profile Photo",
    "EV Insurance",
  ];

  final _stepIcons = [
    Icons.credit_card_outlined,
    Icons.directions_car_outlined,
    Icons.account_circle_outlined,
    Icons.description_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 70,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: IconButton(
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[100],
              ),
              child: Icon(
                Icons.arrow_back,
                color: Colors.black87,
                size: 22,
              ),
            ),
            onPressed: () => Get.back(),
          ),
        ),
        title: Text(
          "Document Verification",
          style: TextStyle(
            color: Colors.black87,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Enhanced step indicator with numbers and titles
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                children: [
                  // Step numbers
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _steps.length,
                      (index) => Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 28,
                              height: 28,
                              decoration: BoxDecoration(
                                color: index <= _currentStep
                                    ? AppColors.primary
                                    : Colors.grey[200],
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(
                                  "${index + 1}",
                                  style: TextStyle(
                                    color: index <= _currentStep
                                        ? Colors.white
                                        : Colors.black54,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                            if (index < _steps.length - 1)
                              Expanded(
                                child: Container(
                                  height: 2,
                                  color: index < _currentStep
                                      ? AppColors.primary
                                      : Colors.grey[200],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Step names in a row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      _steps.length,
                      (index) => Expanded(
                        child: Text(
                          _steps[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: index == _currentStep
                                ? FontWeight.w600
                                : FontWeight.w400,
                            color:
                                index == _currentStep ? AppColors.primary : Colors.black54,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Current step header with icon
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            _stepIcons[_currentStep],
                            color: AppColors.primary,
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _steps[_currentStep],
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "Step ${_currentStep + 1} of ${_steps.length}",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    
                    // Step description in a card
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.2),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.info_outline,
                                size: 18,
                                color: AppColors.primary,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                "Important",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primary,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            _getStepDescription(),
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    
                    // Document upload widgets
                    if (_currentStep != 2) ...[
                      _buildDocumentUpload(
                        title: "Front of ${_steps[_currentStep]}",
                        subtitle: "Align ${_steps[_currentStep]} within the frame",
                      ),
                      const SizedBox(height: 24),
                      _buildDocumentUpload(
                        title: "Back of ${_steps[_currentStep]}",
                        subtitle: "Align ${_steps[_currentStep]} within the frame",
                      ),
                    ] else
                      _buildDocumentUpload(
                        title: "Profile Photo",
                        subtitle: "Take a clear photo with no filters",
                        showBackOption: false,
                        isProfile: true,
                      ),
                  ],
                ),
              ),
            ),
            
            // Enhanced bottom button
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    offset: Offset(0, -2),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: SafeArea(
                child: ElevatedButton(
                  onPressed: () {
                    if (_currentStep < _steps.length - 1) {
                      setState(() {
                        _currentStep++;
                      });
                    } else {
                      Get.to(() => const GetStartedScreen());
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    minimumSize: Size(double.infinity, 52),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _currentStep < _steps.length - 1 ? "Continue" : "Complete Verification",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        _currentStep < _steps.length - 1 
                            ? Icons.arrow_forward 
                            : Icons.check_circle,
                        size: 18,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getStepDescription() {
    switch (_currentStep) {
      case 0:
        return "Please upload clear photos of your National ID (both sides). Ensure all information is clearly visible, well-lit, and all corners are visible in the frame.";
      case 1:
        return "Please upload clear photos of your driver's license (both sides). Make sure your name, photo, license number, and expiration date are clearly visible.";
      case 2:
        return "Please upload a recent profile photo. It should show your full face, be well-lit with a neutral background, and have no filters or sunglasses.";
      case 3:
        return "Please upload your vehicle insurance document. This should clearly show the coverage details, vehicle information, and policy expiration date.";
      default:
        return "";
    }
  }

  Widget _buildDocumentUpload({
    required String title,
    required String subtitle,
    bool showBackOption = true,
    bool isProfile = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.grey.withOpacity(0.2),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                isProfile ? Icons.face : Icons.photo_camera,
                color: AppColors.primary,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black54,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 16),
          
          // Upload container with dashed border
          Container(
            height: isProfile ? 240 : 180,
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.grey.withOpacity(0.3),
                width: 1,
                style: BorderStyle.solid,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Document graphic at the top
                isProfile
                  ? Container(
                      width: 100,
                      height: 100,
                      margin: EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[200],
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.5),
                          width: 1,
                        ),
                      ),
                      child: Icon(
                        Icons.person,
                        size: 60,
                        color: Colors.grey[400],
                      ),
                    )
                  : Container(
                      width: 120,
                      height: 80,
                      margin: EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey[200],
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.5),
                          width: 1,
                        ),
                      ),
                      child: Icon(
                        Icons.insert_drive_file,
                        size: 40,
                        color: Colors.grey[400],
                      ),
                    ),
                
                // Buttons at the bottom
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildUploadButton(
                      icon: Icons.camera_alt,
                      label: "Camera",
                      onTap: () {},
                    ),
                    const SizedBox(width: 16),
                    _buildUploadButton(
                      icon: Icons.photo_library,
                      label: "Gallery",
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          // Example display
          const SizedBox(height: 12),
          if (!isProfile)
            Center(
              child: Text(
                "Example >",
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildUploadButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 16,
              color: AppColors.primary,
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
