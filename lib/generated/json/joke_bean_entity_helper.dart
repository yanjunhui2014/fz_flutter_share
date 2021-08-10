import 'package:ShareDemo/data/bean/joke_bean_entity.dart';

jokeBeanEntityFromJson(JokeBeanEntity data, Map<String, dynamic> json) {
	if (json['reason'] != null) {
		data.reason = json['reason']?.toString();
	}
	if (json['result'] != null) {
		data.result = new JokeBeanResult().fromJson(json['result']);
	}
	if (json['error_code'] != null) {
		data.errorCode = json['error_code']?.toInt();
	}
	return data;
}

Map<String, dynamic> jokeBeanEntityToJson(JokeBeanEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['reason'] = entity.reason;
	if (entity.result != null) {
		data['result'] = entity.result.toJson();
	}
	data['error_code'] = entity.errorCode;
	return data;
}

jokeBeanResultFromJson(JokeBeanResult data, Map<String, dynamic> json) {
	if (json['data'] != null) {
		data.data = new List<JokeBeanResultData>();
		(json['data'] as List).forEach((v) {
			data.data.add(new JokeBeanResultData().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> jokeBeanResultToJson(JokeBeanResult entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.data != null) {
		data['data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	return data;
}

jokeBeanResultDataFromJson(JokeBeanResultData data, Map<String, dynamic> json) {
	if (json['content'] != null) {
		data.content = json['content']?.toString();
	}
	if (json['hashId'] != null) {
		data.hashId = json['hashId']?.toString();
	}
	if (json['unixtime'] != null) {
		data.unixtime = json['unixtime']?.toInt();
	}
	if (json['updatetime'] != null) {
		data.updatetime = json['updatetime']?.toString();
	}
	return data;
}

Map<String, dynamic> jokeBeanResultDataToJson(JokeBeanResultData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['content'] = entity.content;
	data['hashId'] = entity.hashId;
	data['unixtime'] = entity.unixtime;
	data['updatetime'] = entity.updatetime;
	return data;
}