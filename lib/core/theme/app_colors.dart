import 'package:flutter/material.dart';

class AppColors {
  // Brand Colors
  static const primary = Color(0xFF008F9F); // Leron brand color
  static const primaryLight = Color(0xFF00B3C7); // Lighter shade for accents
  static const primaryDark = Color(0xFF006B77); // Darker shade for depth
  
  // Dark Theme Colors
  static const surface = Color(0xFF121212);
  static const background = Color(0xFF000000);
  static const card = Color(0xFF1E1E1E);
  
  // Text Colors
  static const textPrimary = Color(0xFFFFFFFF);
  static const textSecondary = Color(0xFFB3B3B3);
  
  // Accent Colors (Green tints for "Ride Green" theme)
  static const accent1 = Color(0xFF00BFA5); // Eco-friendly green
  static const accent2 = Color(0xFF004D40); // Dark green
  
  // Utility Colors
  static const success = Color(0xFF00B894);
  static const error = Color(0xFFFF4444);
  static const warning = Color(0xFFFFB142);
  
  // Gradient Colors
  static final gradientStart = primary;
  static final gradientEnd = accent2;
}
