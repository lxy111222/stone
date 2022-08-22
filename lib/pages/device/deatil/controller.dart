import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stone/common/apis/device.dart';
import 'package:stone/common/entities/device.dart';
import 'package:stone/common/entities/request.dart';

class DeviceDetailController extends GetxController {
  DeviceDetailController();

  final deviceItem = Get.arguments as DeviceItem;
  final TextEditingController ipController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController commandPortController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    ipController.text = deviceItem.ipv4Address ?? "";
    usernameController.text = deviceItem.username ?? "";
    passwordController.text = deviceItem.password ?? "";
    commandPortController.text = deviceItem.commandPort ?? "";
  }

  deviceLogin() async {
    RequestLoginParams requestLoginParams = RequestLoginParams(
      ipv4Address: ipController.value.text,
      username: usernameController.value.text,
      password: passwordController.value.text,
      commandPort: commandPortController.value.text,
    );
    var result = await DeviceAPI.deviceLogin(
      params: requestLoginParams,
    );
    print("登录返回结果是什么: $result");
  }

  deviceLogout() async {
    var result = await DeviceAPI.deviceClean(
      ipv4Address: ipController.value.text,
    );
    print("注销返回结果是什么: $result");
  }
}
