import 'package:ShareDemo/data/bean/test_entity.dart';

testEntityFromJson(TestEntity data, Map<String, dynamic> json) {
	if (json['reason'] != null) {
		data.reason = json['reason'].toString();
	}
	if (json['result'] != null) {
		data.result = TestResult().fromJson(json['result']);
	}
	return data;
}

Map<String, dynamic> testEntityToJson(TestEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['reason'] = entity.reason;
	data['result'] = entity.result?.toJson();
	return data;
}

testResultFromJson(TestResult data, Map<String, dynamic> json) {
	if (json['data'] != null) {
		data.data = (json['data'] as List).map((v) => TestResultData().fromJson(v)).toList();
	}
	return data;
}

Map<String, dynamic> testResultToJson(TestResult entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['data'] =  entity.data?.map((v) => v.toJson())?.toList();
	return data;
}

testResultDataFromJson(TestResultData data, Map<String, dynamic> json) {
	if (json['content'] != null) {
		data.content = json['content'].toString();
	}
	if (json['hashId'] != null) {
		data.hashId = json['hashId'].toString();
	}
	if (json['unixtime'] != null) {
		data.unixtime = json['unixtime'] is String
				? int.tryParse(json['unixtime'])
				: json['unixtime'].toInt();
	}
	if (json['updatetime'] != null) {
		data.updatetime = json['updatetime'].toString();
	}
	return data;
}

Map<String, dynamic> testResultDataToJson(TestResultData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['content'] = entity.content;
	data['hashId'] = entity.hashId;
	data['unixtime'] = entity.unixtime;
	data['updatetime'] = entity.updatetime;
	return data;
}