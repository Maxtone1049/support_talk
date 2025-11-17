// airtime_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wepay/Models/Mobile%20Data/mobile_data_category.dart';
import 'package:wepay/UI/onboarding/Authentication/token%20provider/auth_token_provider.dart';
import 'dart:convert';

import 'package:wepay/services/network/api.dart';

final airtimeServiceProvider =
    StateNotifierProvider<AirtimeServiceNotifier, AirtimeServiceState>((ref) {
      final token = ref.watch(tokenProvider);
      return AirtimeServiceNotifier(token!);
    });

class AirtimeServiceNotifier extends StateNotifier<AirtimeServiceState> {
  final String _token;

  AirtimeServiceNotifier(this._token) : super(AirtimeServiceState());

  Future<void> fetchServiceCategories(String id) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      // Check if token is available
      if (_token.isEmpty) {
        state = state.copyWith(
          isLoading: false,
          error: "Authentication token is missing",
        );
        return;
      }

      final response = await Api().getRequest(
        "/getServiceCategories/$id",
        _token,
      );
      final responseBody = await response.stream.bytesToString();
      final body = jsonDecode(responseBody);

      if (response.statusCode >= 200 && response.statusCode <= 299) {
        final serviceModel = ServiceCategoryModel.fromJson(body);
        state = state.copyWith(
          isLoading: false,
          networkProviders: serviceModel.data ?? [],
          error: null,
        );
      } else if (response.statusCode == 401) {
        // Handle unauthorized error
        state = state.copyWith(
          isLoading: false,
          error: "Session expired. Please login again.",
        );
      } else {
        state = state.copyWith(
          isLoading: false,
          error: "Error fetching service list",
        );
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: "An error occurred: ${e.toString()}",
      );
    }
  }
}

class AirtimeServiceState {
  final bool isLoading;
  final String? error;
  final List<DataCategoryDatum> networkProviders;

  AirtimeServiceState({
    this.isLoading = false,
    this.error,
    this.networkProviders = const [],
  });

  AirtimeServiceState copyWith({
    bool? isLoading,
    String? error,
    List<DataCategoryDatum>? networkProviders,
  }) {
    return AirtimeServiceState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      networkProviders: networkProviders ?? this.networkProviders,
    );
  }
}
// final airtimeServiceProvider =
//     StateNotifierProvider<AirtimeServiceNotifier, AirtimeServiceState>((ref) {
//       return AirtimeServiceNotifier();
//     });

// class AirtimeServiceNotifier extends StateNotifier<AirtimeServiceState> {
//   AirtimeServiceNotifier() : super(AirtimeServiceState());

//   Future<void> fetchServiceCategories(String id) async {
//     state = state.copyWith(isLoading: true, error: null);

//     try {

//       final response = await Api().getRequest("/getServiceCategories/$id", token);
//       final responseBody = await response.stream.bytesToString();
//       final body = jsonDecode(responseBody);

//       if (response.statusCode >= 200 && response.statusCode <= 299) {
//         final serviceModel = ServiceCategoryModel.fromJson(body);
//         state = state.copyWith(
//           isLoading: false,
//           networkProviders: serviceModel.data ?? [],
//           error: null,
//         );
//       } else {
//         state = state.copyWith(
//           isLoading: false,
//           error: "Error fetching service list",
//         );
//       }
//     } catch (e) {
//       state = state.copyWith(
//         isLoading: false,
//         error: "An error occurred: ${e.toString()}",
//       );
//     }
//   }
// }

// class AirtimeServiceState {
//   final bool isLoading;
//   final String? error;
//   final List<DataCategoryDatum> networkProviders;

//   AirtimeServiceState({
//     this.isLoading = false,
//     this.error,
//     this.networkProviders = const [],
//   });

//   AirtimeServiceState copyWith({
//     bool? isLoading,
//     String? error,
//     List<DataCategoryDatum>? networkProviders,
//   }) {
//     return AirtimeServiceState(
//       isLoading: isLoading ?? this.isLoading,
//       error: error ?? this.error,
//       networkProviders: networkProviders ?? this.networkProviders,
//     );
//   }
// }
