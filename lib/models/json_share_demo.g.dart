// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_share_demo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JsonShareDemo _$JsonShareDemoFromJson(Map<String, dynamic> json) {
  return JsonShareDemo()
    ..reason = json['reason'] as String
    ..result = json['result'] == null
        ? null
        : Result.fromJson(json['result'] as Map<String, dynamic>);
}

Map<String, dynamic> _$JsonShareDemoToJson(JsonShareDemo instance) =>
    <String, dynamic>{
      'reason': instance.reason,
      'result': instance.result,
    };

Result _$ResultFromJson(Map<String, dynamic> json) {
  return Result()..data = json['data'] as List;
}

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'data': instance.data,
    };
