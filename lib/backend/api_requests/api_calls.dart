import 'dart:convert';

import 'package:w_o_s_p_schedule_part/backend/models/event.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const endpoint_url = "https://api.jsonbin.io/v3/qs/65b3c63fdc746540189b88d2";

class GetScheduleCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getSchedule',
      apiUrl: endpoint_url,
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static Events? scheduleItems(ApiCallResponse response) {
    Response jsonResponse = Response.fromJson(json.decode(response.response?.body ?? "")) ;
    return jsonResponse.record;
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
