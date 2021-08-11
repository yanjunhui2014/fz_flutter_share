import 'package:json_annotation/json_annotation.dart';


part 'json_share_demo.g.dart';

@JsonSerializable()
class JsonShareDemo {
      JsonShareDemo();

  String reason;
  Result result;

  factory JsonShareDemo.fromJson(Map<String,dynamic> json) => _$JsonShareDemoFromJson(json);
  Map<String, dynamic> toJson() => _$JsonShareDemoToJson(this);
}

@JsonSerializable()
class Result {
      Result();

  List<dynamic> data;

  factory Result.fromJson(Map<String,dynamic> json) => _$ResultFromJson(json);
  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
