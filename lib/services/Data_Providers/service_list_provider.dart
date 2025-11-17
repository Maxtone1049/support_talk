import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wepay/Models/Service%20List/service_list_model.dart';
import 'package:wepay/UI/onboarding/Authentication/token%20provider/auth_token_provider.dart';
import 'package:wepay/services/network/api.dart';

final serviceListProvider = FutureProvider<ServiceListModel>((ref) async {
  return await getServiceList(ref);
});

Future<ServiceListModel> getServiceList(Ref ref) async {
  final token = ref.read(tokenProvider);
  try {
    final response = await Api().getRequest("/getListsOfServices", token);
    final responseBody = await response.stream.bytesToString();
    final body = jsonDecode(responseBody);

    if (response.statusCode >= 200 && response.statusCode <= 299) {
      return ServiceListModel.fromJson(body);
    } else {
      throw Exception("Error fetching service list: ${body['message']}");
    }
  } catch (e, st) {
    debugPrint("Failed to load service list: $e\n$st");
    throw Exception("Failed to load service list: $e");
  }
}
