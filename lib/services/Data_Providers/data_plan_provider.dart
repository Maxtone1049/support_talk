// data_plan_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wepay/Models/Mobile%20Data/mobile_data_model.dart';
import 'dart:convert';

import 'package:wepay/services/network/api.dart';

final dataPlanProvider = StateNotifierProvider<DataPlanNotifier, DataPlanState>(
  (ref) {
    return DataPlanNotifier();
  },
);

class DataPlanNotifier extends StateNotifier<DataPlanState> {
  DataPlanNotifier() : super(DataPlanState());

  Future<void> fetchDataPlans(String providerId) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final response = await Api().getRequest2(
        "/getServiceCategoryProduct/$providerId",
      );
      final responseBody = await response.stream.bytesToString();
      final data = jsonDecode(responseBody);

      if (response.statusCode >= 200 && response.statusCode <= 299) {
        final planResponse = DataPlanResponse.fromJson(data);
        state = state.copyWith(
          isLoading: false,
          dataPlans: planResponse.data ?? [],
          error: null,
        );
      } else {
        state = state.copyWith(
          isLoading: false,
          error: "Error fetching data plans",
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

class DataPlanState {
  final bool isLoading;
  final String? error;
  final List<DataPlan> dataPlans;
  DataPlan? selectedPlan;

  DataPlanState({
    this.isLoading = false,
    this.error,
    this.dataPlans = const [],
    this.selectedPlan,
  });

  DataPlanState copyWith({
    bool? isLoading,
    String? error,
    List<DataPlan>? dataPlans,
    DataPlan? selectedPlan,
  }) {
    return DataPlanState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      dataPlans: dataPlans ?? this.dataPlans,
      selectedPlan: selectedPlan ?? this.selectedPlan,
    );
  }
}
