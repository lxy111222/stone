import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stone/common/values/colors.dart';
import 'package:stone/common/widgets/app.dart';
import 'package:stone/common/widgets/button.dart';
import 'package:stone/common/widgets/input.dart';
import 'package:stone/pages/device/deatil/controller.dart';

class DeviceDetailPage extends GetView<DeviceDetailController> {
  const DeviceDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: transparentAppBar(
        title: Text(
          "设备详情 ${controller.deviceItem.ipv4Address}",
          style: TextStyle(
            color: AppColors.primaryText,
            fontFamily: 'Montserrat',
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.search,
              color: AppColors.primaryText,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Center(
        child: Container(
          width: 295.w,
          margin: EdgeInsets.only(top: 49.h),
          child: Column(
            children: [
              inputTextEdit(
                controller: controller.ipController,
                keyboardType: TextInputType.number,
                hintText: "IP地址",
                marginTop: 0,
                autofocus: true,
              ),
              inputTextEdit(
                controller: controller.usernameController,
                keyboardType: TextInputType.text,
                hintText: "账号",
                marginTop: 10,
              ),
              inputTextEdit(
                controller: controller.passwordController,
                keyboardType: TextInputType.visiblePassword,
                hintText: "密码",
                marginTop: 10,
              ),
              inputTextEdit(
                controller: controller.commandPortController,
                keyboardType: TextInputType.number,
                hintText: "端口",
                marginTop: 10,
              ),
              Container(
                height: 44.h,
                margin: EdgeInsets.only(top: 15.h),
                child: Row(
                  children: [
                    // 注册
                    btnFlatButtonWidget(
                      onPressed: controller.deviceLogin,
                      gbColor: AppColors.thirdElement,
                      title: "登录",
                    ),
                    Spacer(),
                    // 登录
                    btnFlatButtonWidget(
                      onPressed: controller.deviceLogout,
                      gbColor: AppColors.primaryElement,
                      title: "注销",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
