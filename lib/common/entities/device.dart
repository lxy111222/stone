/// 设备分页 request
class DevicePageListRequestEntity {
  String? keyword;
  int? pageNum;
  int? pageSize;

  DevicePageListRequestEntity({this.keyword, this.pageNum, this.pageSize});
  Map<String, dynamic> toJson() => {
    "pageNum": pageNum,
    "pageSize": pageSize,
  };
}

class DevicePageListResponseEntity {
  int? code;
  String? msg;
  int? counts;
  int? pagesize;
  int? pages;
  int? page;
  List<DeviceItem>? items;

  DevicePageListResponseEntity({
    this.code,
    this.msg,
    this.counts,
    this.pagesize,
    this.pages,
    this.page,
    this.items,
  });

  factory DevicePageListResponseEntity.fromJson(Map<String, dynamic> json) =>
      DevicePageListResponseEntity(
          code: json["code"],
          msg: json["msg"],
          counts: json["data"]["counts"],
          pagesize: json["data"]["pagesize"],
          pages: json["data"]["pages"],
          page: json["data"]["page"],
          items: json["data"]["items"] == null
              ? []
              : List<DeviceItem>.from(
                  json["data"]["items"].map((x) => DeviceItem.fromJson(x))));
}

class DeviceItem {
  String? deviceSn;
  String? title;
  String? ipv4Address;
  String? dspVersion;
  String? deviceDescription;
  DateTime? bootTime;
  String? commandPort;
  String? username;
  String? password;
  String? activated;
  int? loginId;
  int? alarmHandleId;
  int? previewHandleId;
  int? analogChannelNum;
  String? screenPicture;

  DeviceItem({
    this.deviceSn,
    this.title,
    this.ipv4Address,
    this.dspVersion,
    this.deviceDescription,
    this.bootTime,
    this.commandPort,
    this.username,
    this.password,
    this.activated,
    this.loginId,
    this.alarmHandleId,
    this.previewHandleId,
    this.analogChannelNum,
    this.screenPicture,
  });

  factory DeviceItem.fromJson(Map<String, dynamic> json) => DeviceItem(
        deviceSn: json["deviceSn"],
        title: json["title"],
        ipv4Address: json["ipv4Address"],
        dspVersion: json["dspVersion"],
        deviceDescription: json["deviceDescription"],
        bootTime: DateTime.parse(json["bootTime"]),
        commandPort: json["commandPort"],
        username: json["username"],
        password: json["password"],
        activated: json["activated"],
        loginId: json["loginId"],
        alarmHandleId: json["alarmHandleId"],
        previewHandleId: json["previewHandleId"],
        analogChannelNum: json["analogChannelNum"],
        screenPicture: json["screenPicture"],
      );

  Map<String, dynamic> toJson() => {
        "deviceSn": deviceSn,
        "title": title,
        "ipv4Address": ipv4Address,
        "dspVersion": dspVersion,
        "deviceDescription": deviceDescription,
        "bootTime": bootTime?.toIso8601String(),
        "commandPort": commandPort,
        "username": username,
        "password": password,
        "activated": activated,
        "loginId": loginId,
        "alarmHandleId": alarmHandleId,
        "previewHandleId": previewHandleId,
        "analogChannelNum": analogChannelNum,
        "screenPicture": screenPicture,
      };
}
