import 'package:ShareDemo/generated/json/base/json_convert_content.dart';
import 'package:ShareDemo/data/bean/jork_bean_entity.dart';

JorkBeanEntity $JorkBeanEntityFromJson(Map<String, dynamic> json) {
	final JorkBeanEntity jorkBeanEntity = JorkBeanEntity();
	final String? reason = jsonConvert.convert<String>(json['reason']);
	if (reason != null) {
		jorkBeanEntity.reason = reason;
	}
	final JorkBeanResult? result = jsonConvert.convert<JorkBeanResult>(json['result']);
	if (result != null) {
		jorkBeanEntity.result = result;
	}
	return jorkBeanEntity;
}

Map<String, dynamic> $JorkBeanEntityToJson(JorkBeanEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['reason'] = entity.reason;
	data['result'] = entity.result.toJson();
	return data;
}

JorkBeanResult $JorkBeanResultFromJson(Map<String, dynamic> json) {
	final JorkBeanResult jorkBeanResult = JorkBeanResult();
	final List<JorkBeanResultData>? data = jsonConvert.convertListNotNull<JorkBeanResultData>(json['data']);
	if (data != null) {
		jorkBeanResult.data = data;
	}
	return jorkBeanResult;
}

Map<String, dynamic> $JorkBeanResultToJson(JorkBeanResult entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['data'] =  entity.data.map((v) => v.toJson()).toList();
	return data;
}

JorkBeanResultData $JorkBeanResultDataFromJson(Map<String, dynamic> json) {
	final JorkBeanResultData jorkBeanResultData = JorkBeanResultData();
	final String? content = jsonConvert.convert<String>(json['content']);
	if (content != null) {
		jorkBeanResultData.content = content;
	}
	final String? hashId = jsonConvert.convert<String>(json['hashId']);
	if (hashId != null) {
		jorkBeanResultData.hashId = hashId;
	}
	final int? unixtime = jsonConvert.convert<int>(json['unixtime']);
	if (unixtime != null) {
		jorkBeanResultData.unixtime = unixtime;
	}
	final String? updatetime = jsonConvert.convert<String>(json['updatetime']);
	if (updatetime != null) {
		jorkBeanResultData.updatetime = updatetime;
	}
	return jorkBeanResultData;
}

Map<String, dynamic> $JorkBeanResultDataToJson(JorkBeanResultData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['content'] = entity.content;
	data['hashId'] = entity.hashId;
	data['unixtime'] = entity.unixtime;
	data['updatetime'] = entity.updatetime;
	return data;
}