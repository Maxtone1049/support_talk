import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wepay/UI/dashboard/Pages/Bill_payment/Electricity/widgets/provider_list.dart';
import 'package:wepay/common/Utils/App_Theme/app_theme.dart';
import 'package:wepay/common/Utils/Custom_Icons/custom_icons.dart';
import 'package:wepay/services/others/electricity_providers.dart';

class ProviderSelectionScreen extends StatefulWidget {
  const ProviderSelectionScreen({super.key});

  @override
  State<ProviderSelectionScreen> createState() =>
      _ProviderSelectionScreenState();
}

class _ProviderSelectionScreenState extends State<ProviderSelectionScreen> {
  String? _selectedProviderId;
  bool _isLoading = true;

  // Mock data for Nigerian electricity providers

  @override
  void initState() {
    super.initState();
    _loadSelectedProvider();
  }

  /// Load previously selected provider from SharedPreferences
  Future<void> _loadSelectedProvider() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedProviderId = prefs.getString('selected_provider_id');

      if (mounted) {
        setState(() {
          _selectedProviderId = savedProviderId;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  /// Save selected provider to SharedPreferences
  Future<void> _saveSelectedProvider(String providerId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('selected_provider_id', providerId);

      // Also save provider details for easy access
      final provider = electricityProviders.firstWhere(
        (p) => p['id'] == providerId,
      );
      await prefs.setString(
        'selected_provider_name',
        provider['name'] as String,
      );
      await prefs.setString(
        'selected_provider_short_name',
        provider['shortName'] as String,
      );
      await prefs.setString(
        'selected_provider_logo',
        provider['logoUrl'] as String,
      );
    } catch (e) {
      // Handle error silently
    }
  }

  /// Handle provider selection
  void _onProviderSelected(String providerId) {
    setState(() {
      _selectedProviderId = providerId;
    });
    _saveSelectedProvider(providerId);
  }

  /// Handle continue button press
  // void _onContinuePressed() {
  //   if (_selectedProviderId != null) {
  //     Navigator.pushNamed(context, '/main-dashboard');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppTheme.lightTheme.colorScheme.primary,
              AppTheme.lightTheme.colorScheme.primaryContainer,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Custom App Bar
              Container(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                child: Row(
                  children: [
                    // Back button
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: CustomIconWidget(
                        iconName: 'arrow_back_ios',
                        color: Colors.white,
                        size: 20,
                      ),
                      splashRadius: 24,
                    ),
                    SizedBox(width: 2.w),
                    // Title
                    Expanded(
                      child: Text(
                        'Select Provider',
                        style: GoogleFonts.inter(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          letterSpacing: 0.15,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(width: 12.w), // Balance the back button space
                  ],
                ),
              ),

              // Provider list
              Expanded(
                child:
                    _isLoading
                        ? Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                          ),
                        )
                        : ListView.builder(
                          padding: EdgeInsets.symmetric(vertical: 2.h),
                          itemCount: electricityProviders.length,
                          itemBuilder: (context, index) {
                            final provider = electricityProviders[index];
                            return ProviderListItem(
                              provider: provider,
                              selectedProviderId: _selectedProviderId,
                              onProviderSelected: _onProviderSelected,
                            );
                          },
                        ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
