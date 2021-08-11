import 'package:ShareDemo/data/bean/ResponseFromPluginEntity.dart';

responseFromPluginEntityFromJson(ResponseFromPluginEntity data, Map<String, dynamic> json) {
	if (json['reason'] != null) {
		data.reason = json['reason'].toString();
	}
	if (json['result'] != null) {
		data.result = ResponseFromPluginResult().fromJson(json['result']);
	}
	return data;
}

Map<String, dynamic> responseFromPluginEntityToJson(ResponseFromPluginEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['reason'] = entity.reason;
	data['result'] = entity.result?.toJson();
	return data;
}

responseFromPluginResultFromJson(ResponseFromPluginResult data, Map<String, dynamic> json) {
	if (json['data'] != null) {
		data.data = (json['data'] as List).map((v) => ResponseFromPluginResultData().fromJson(v)).toList();
	}
	return data;
}

Map<String, dynamic> responseFromPluginResultToJson(ResponseFromPluginResult entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['data'] =  entity.data?.map((v) => v.toJson())?.toList();
	return data;
}

responseFromPluginResultDataFromJson(ResponseFromPluginResultData data, Map<String, dynamic> json) {
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

Map<String, dynamic> responseFromPluginResultDataToJson(ResponseFromPluginResultData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['content'] = entity.content;
	data['hashId'] = entity.hashId;
	data['unixtime'] = entity.unixtime;
	data['updatetime'] = entity.updatetime;
	return data;
}