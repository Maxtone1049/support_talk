// token_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final tokenProvider = StateProvider<String?>((ref) => null);

// Helper function to initialize and persist token
Future<void> initializeToken(StateController<String?> tokenState) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    final savedToken = prefs.getString('auth_token');
    if (savedToken != null) {
      tokenState.state = savedToken;
    }
  } catch (e) {
    print('Error loading token: $e');
  }
}

// Helper function to save token
Future<void> saveToken(
  String token,
  StateController<String?> tokenState,
) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
    tokenState.state = token;
  } catch (e) {
    print('Error saving token: $e');
  }
}

// Helper function to clear token
Future<void> clearToken(StateController<String?> tokenState) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
    tokenState.state = null;
  } catch (e) {
    print('Error clearing token: $e');
  }
}
