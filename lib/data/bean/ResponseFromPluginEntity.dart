import 'package:ShareDemo/generated/json/base/json_convert_content.dart';

class ResponseFromPluginEntity with JsonConvert<ResponseFromPluginEntity> {
	String reason;
	ResponseFromPluginResult result;
}

class ResponseFromPluginResult with JsonConvert<ResponseFromPluginResult> {
	List<ResponseFromPluginResultData> data;
}

class ResponseFromPluginResultData with JsonConvert<ResponseFromPluginResultData> {
	String content;
	String hashId;
	int unixtime;
	String updatetime;
}
