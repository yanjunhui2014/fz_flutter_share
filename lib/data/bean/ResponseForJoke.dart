
class ResponseForJoke {
  String reason;
  ResponseForJokeResult result;

  ResponseForJoke({this.reason, this.result});

  ResponseForJoke.fromJson(Map<String, dynamic> json) {
    reason = json['reason'];
    result =
    json['result'] != null ? new ResponseForJokeResult.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reason'] = this.reason;
    if (this.result != null) {
      data['result'] = this.result.toJson();
    }
    return data;
  }
}

class ResponseForJokeResult {
  List<ResponseForJokeResultItem> data;

  ResponseForJokeResult({this.data});

  ResponseForJokeResult.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<ResponseForJokeResultItem>();
      json['data'].forEach((v) {
        data.add(new ResponseForJokeResultItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ResponseForJokeResultItem {
  String content;
  String hashId;
  int unixtime;
  String updatetime;

  ResponseForJokeResultItem({this.content, this.hashId, this.unixtime, this.updatetime});

  ResponseForJokeResultItem.fromJson(Map<String, dynamic> json) {
    content = json['content'];
    hashId = json['hashId'];
    unixtime = json['unixtime'];
    updatetime = json['updatetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['content'] = this.content;
    data['hashId'] = this.hashId;
    data['unixtime'] = this.unixtime;
    data['updatetime'] = this.updatetime;
    return data;
  }
}