import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class CreateNewTaskCall {
  static Future<ApiCallResponse> call({
    dynamic promptJson,
    dynamic functionsJson,
    dynamic functionCallJson,
  }) async {
    final prompt = _serializeJson(promptJson);
    final functions = _serializeJson(functionsJson);
    final functionCall = _serializeJson(functionCallJson);
    final ffApiRequestBody = '''
{
  "model": "gpt-3.5-turbo-0613",
  "messages": $prompt,
  "functions": $functions,
  "function_call": $functionCall
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create New Task',
      apiUrl: 'https://api.openai.com/v1/chat/completions',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer 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',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? taskResponse(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.choices[:].message.function_call.arguments''',
      ));
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
