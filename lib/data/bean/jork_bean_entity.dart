import 'package:ShareDemo/generated/json/base/json_field.dart';
import 'package:ShareDemo/generated/json/jork_bean_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class JorkBeanEntity {
	late String reason;
	late JorkBeanResult result;

	JorkBeanEntity();

	factory JorkBeanEntity.fromJson(Map<String, dynamic> json) => $JorkBeanEntityFromJson(json);

	Map<String, dynamic> toJson() => $JorkBeanEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class JorkBeanResult {
	late List<JorkBeanResultData> data;

	JorkBeanResult();

	factory JorkBeanResult.fromJson(Map<String, dynamic> json) => $JorkBeanResultFromJson(json);

	Map<String, dynamic> toJson() => $JorkBeanResultToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class JorkBeanResultData {
	late String content;
	late String hashId;
	late int unixtime;
	late String updatetime;

	JorkBeanResultData();

	factory JorkBeanResultData.fromJson(Map<String, dynamic> json) => $JorkBeanResultDataFromJson(json);

	Map<String, dynamic> toJson() => $JorkBeanResultDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}