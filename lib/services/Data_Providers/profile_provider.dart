import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wepay/Models/Profile/profile_model.dart';
import 'package:wepay/UI/onboarding/Authentication/token%20provider/auth_token_provider.dart';

import 'package:wepay/services/network/api.dart';

final profileProvider = FutureProvider<ProfileModel>((ref) async {
  try {
    // TODO: replace with however you're storing/retrieving token
    //final token = await ref.read(authTokenProvider.future);
    final token = ref.read(tokenProvider);

    final response = await Api().getRequest("/my-profile", token);
    final responseBody = await response.stream.bytesToString();
    final body = jsonDecode(responseBody);
    debugPrint("body: $body");

    if (response.statusCode >= 200 && response.statusCode <= 299) {
      return ProfileModel.fromJson(body);
    } else {
      debugPrint("body: $body");
      throw Exception("Error fetching profile");
    }
  } catch (e) {
    debugPrint("body: $e");
    throw Exception("Failed to fetch profile: $e");
  }
});
// final profileProvider = FutureProvider<ProfileModel>((ref) async {
//   try {
//     final api = Api();
//     final response = await api.getRequest("/my-profile", token);
//     final responseBody = await response.stream.bytesToString();

//     if (response.statusCode >= 200 && response.statusCode <= 299) {
//       final body = jsonDecode(responseBody);
//       return profileModelFromJson(body);
//     } else {
//       throw Exception('Failed to fetch profile: ${response.statusCode}');
//     }
//   } catch (e) {
//     throw Exception('Error fetching profile: $e');
//   }
// });

// // Optional: Profile State Provider for local state management
// final profileStateProvider =
//     StateNotifierProvider<ProfileNotifier, ProfileState>((ref) {
//       return ProfileNotifier();
//     });

// class ProfileNotifier extends StateNotifier<ProfileState> {
//   ProfileNotifier() : super(ProfileState.initial());

//   Future<void> updateProfile(ProfileModel profile) async {
//     state = state.copyWith(profile: profile, isLoading: false, error: null);
//   }

//   void setLoading(bool isLoading) {
//     state = state.copyWith(isLoading: isLoading);
//   }

//   void setError(String error) {
//     state = state.copyWith(error: error, isLoading: false);
//   }
// }

// class ProfileState {
//   final ProfileModel? profile;
//   final bool isLoading;
//   final String? error;

//   const ProfileState({this.profile, this.isLoading = false, this.error});

//   factory ProfileState.initial() {
//     return const ProfileState(isLoading: false);
//   }

//   ProfileState copyWith({
//     ProfileModel? profile,
//     bool? isLoading,
//     String? error,
//   }) {
//     return ProfileState(
//       profile: profile ?? this.profile,
//       isLoading: isLoading ?? this.isLoading,
//       error: error,
//     );
//   }
// }

// final apiServiceProvider = Provider<Api>((ref) => Api());

// final profileProvider = FutureProvider<ProfileModel>((ref) async {
//   final apiService = ref.read(apiServiceProvider);

//   try {
//     print('Fetching profile data...');
//     final response = await apiService.getRequest2("/my-profile");
//     final dataBody = await response.stream.bytesToString();
//     final body = jsonDecode(dataBody);

//     print('Response status: ${response.statusCode}');
//     // print('Response body: ${response.body}');

//     if (response.statusCode >= 200 && response.statusCode <= 299) {
//       final body = jsonDecode(dataBody);
//       final profile = profileModelFromJson(body);
//       print('Profile fetched successfully: ${profile.userDetails?.fullName}');
//       return profile;
//     } else {
//       final errorBody = jsonDecode(dataBody);
//       final errorMessage = errorBody['message'] ?? 'Failed to fetch profile';
//       print('API Error: $errorMessage');
//       throw Exception(errorMessage);
//     }
//   } catch (e) {
//     print('Profile fetch error: $e');
//     throw Exception('Failed to load profile: ${e.toString()}');
//   }
// });
// final profileProvider = FutureProvider<ProfileModel>((ref) async {
//   try {
//     final response = await Api().getRequest("/my-profile", token);
//     final responseBody = await response.stream.bytesToString();
//     final body = jsonDecode(responseBody);
//     log("body $body");

//     if (response.statusCode >= 200 && response.statusCode <= 299) {
//       return profileModelFromJson(body);
//     } else {
//       throw Exception("Failed to fetch profile");
//     }
//   } catch (e) {
//     throw Exception("Error fetching profile: $e");
//   }
// });
