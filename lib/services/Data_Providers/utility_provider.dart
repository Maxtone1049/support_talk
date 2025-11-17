// utility_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wepay/Models/Mobile%20Data/mobile_data_category.dart';
import 'package:wepay/UI/onboarding/Authentication/token%20provider/auth_token_provider.dart';
import 'dart:convert';

import 'package:wepay/services/network/api.dart';

final utilityProvider =
    StateNotifierProvider<UtilityServiceNotifier, UtilityServiceState>((ref) {
      final token = ref.watch(tokenProvider);
      return UtilityServiceNotifier(token ?? '');
    });

class UtilityServiceNotifier extends StateNotifier<UtilityServiceState> {
  final String _token;

  UtilityServiceNotifier(this._token) : super(UtilityServiceState());

  Future<void> fetchUtilityProviders(String id) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
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
          providers: serviceModel.data ?? [],
          error: null,
        );
      } else if (response.statusCode == 401) {
        state = state.copyWith(
          isLoading: false,
          error: "Session expired. Please login again.",
        );
      } else {
        state = state.copyWith(
          isLoading: false,
          error: body['message'] ?? "Error fetching providers",
        );
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: "An error occurred: ${e.toString()}",
      );
    }
  }

  void selectProvider(DataCategoryDatum provider) {
    state = state.copyWith(selectedProvider: provider);
  }

  void selectAmount(String amount) {
    state = state.copyWith(selectedAmount: amount);
  }

  void setPaymentType(String type) {
    state = state.copyWith(paymentType: type);
  }
}

class UtilityServiceState {
  final bool isLoading;
  final String? error;
  final List<DataCategoryDatum> providers;
  final DataCategoryDatum? selectedProvider;
  final String? selectedAmount;
  final String paymentType;

  UtilityServiceState({
    this.isLoading = false,
    this.error,
    this.providers = const [],
    this.selectedProvider,
    this.selectedAmount,
    this.paymentType = "Prepaid",
  });

  UtilityServiceState copyWith({
    bool? isLoading,
    String? error,
    List<DataCategoryDatum>? providers,
    DataCategoryDatum? selectedProvider,
    String? selectedAmount,
    String? paymentType,
  }) {
    return UtilityServiceState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      providers: providers ?? this.providers,
      selectedProvider: selectedProvider ?? this.selectedProvider,
      selectedAmount: selectedAmount ?? this.selectedAmount,
      paymentType: paymentType ?? this.paymentType,
    );
  }
}

// final utilityProvider =
//     StateNotifierProvider<AirtimeServiceNotifier, AirtimeServiceState>((ref) {
//       final token = ref.watch(tokenProvider);
//       return AirtimeServiceNotifier(token!);
//     });

// class AirtimeServiceNotifier extends StateNotifier<AirtimeServiceState> {
//   final String _token;

//   AirtimeServiceNotifier(this._token) : super(AirtimeServiceState());

//   Future<void> fetchServiceCategories(String id) async {
//     state = state.copyWith(isLoading: true, error: null);

//     try {
//       // Check if token is available
//       if (_token.isEmpty) {
//         state = state.copyWith(
//           isLoading: false,
//           error: "Authentication token is missing",
//         );
//         return;
//       }

//       final response = await Api().getRequest(
//         "/getServiceCategories/$id",
//         _token,
//       );
//       final responseBody = await response.stream.bytesToString();
//       final body = jsonDecode(responseBody);

//       if (response.statusCode >= 200 && response.statusCode <= 299) {
//         final serviceModel = ServiceCategoryModel.fromJson(body);
//         state = state.copyWith(
//           isLoading: false,
//           networkProviders: serviceModel.data ?? [],
//           error: null,
//         );
//       } else if (response.statusCode == 401) {
//         // Handle unauthorized error
//         state = state.copyWith(
//           isLoading: false,
//           error: "Session expired. Please login again.",
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

// StateNotifierProvider<UtilityNotifier, UtilityState>((
//   ref,
// ) {
//   return UtilityNotifier();
// });

// class UtilityNotifier extends StateNotifier<UtilityState> {
//   UtilityNotifier() : super(UtilityState());

//   Future<void> fetchUtilityProviders(String id) async {
//     state = state.copyWith(isLoading: true, error: null);

//     try {
//       final response = await Api().getRequest2("/getServiceCategories/$id");
//       final responseBody = await response.stream.bytesToString();
//       final body = jsonDecode(responseBody);

//       if (response.statusCode >= 200 && response.statusCode <= 299) {
//         final serviceModel = ServiceCategoryModel.fromJson(body);
//         state = state.copyWith(
//           isLoading: false,
//           utilityProviders: serviceModel.data ?? [],
//           error: null,
//         );
//       } else {
//         state = state.copyWith(
//           isLoading: false,
//           error: "Error fetching utility providers",
//         );
//       }
//     } catch (e) {
//       state = state.copyWith(
//         isLoading: false,
//         error: "An error occurred: ${e.toString()}",
//       );
//     }
//   }

//   void selectProvider(DataCategoryDatum provider) {
//     state = state.copyWith(selectedProvider: provider);
//   }

//   void selectAmount(String amount) {
//     state = state.copyWith(selectedAmount: amount);
//   }

//   void setPaymentType(String type) {
//     state = state.copyWith(paymentType: type);
//   }
// }

// class UtilityState {
//   final bool isLoading;
//   final String? error;
//   final List<DataCategoryDatum> utilityProviders;
//   final DataCategoryDatum? selectedProvider;
//   final String? selectedAmount;
//   final String paymentType;

//   UtilityState({
//     this.isLoading = false,
//     this.error,
//     this.utilityProviders = const [],
//     this.selectedProvider,
//     this.selectedAmount,
//     this.paymentType = 'Prepaid',
//   });

//   UtilityState copyWith({
//     bool? isLoading,
//     String? error,
//     List<DataCategoryDatum>? utilityProviders,
//     DataCategoryDatum? selectedProvider,
//     String? selectedAmount,
//     String? paymentType,
//   }) {
//     return UtilityState(
//       isLoading: isLoading ?? this.isLoading,
//       error: error ?? this.error,
//       utilityProviders: utilityProviders ?? this.utilityProviders,
//       selectedProvider: selectedProvider ?? this.selectedProvider,
//       selectedAmount: selectedAmount ?? this.selectedAmount,
//       paymentType: paymentType ?? this.paymentType,
//     );
//   }
// }
