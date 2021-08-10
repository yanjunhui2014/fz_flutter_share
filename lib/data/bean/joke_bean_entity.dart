import 'package:ShareDemo/generated/json/base/json_convert_content.dart';
import 'package:ShareDemo/generated/json/base/json_field.dart';

class JokeBeanEntity with JsonConvert<JokeBeanEntity> {
	String reason;
	JokeBeanResult result;
	@JSONField(name: "error_code")
	int errorCode;
}

class JokeBeanResult with JsonConvert<JokeBeanResult> {
	List<JokeBeanResultData> data;
}

class JokeBeanResultData with JsonConvert<JokeBeanResultData> {
	String content;
	String hashId;
	int unixtime;
	String updatetime;
}
