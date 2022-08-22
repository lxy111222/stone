import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stone/common/entities/device.dart';
import 'package:stone/common/routers/names.dart';
import 'package:stone/common/utils/utils.dart';
import 'package:stone/common/values/values.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stone/common/widgets/image.dart';

Widget deviceListItem(DeviceItem item) {
  return Container(
    height: 161.h,
    padding: EdgeInsets.all(20.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // 图
        InkWell(
          onTap: () {
            // ExtendedNavigator.rootNavigator.pushNamed(
            //   Routes.detailsPageRoute,
            //   arguments: DetailsPageArguments(item: item),
            // );
            Get.toNamed(AppRoutes.DeviceDetail, arguments: item);
          },
          child: netImageCached(
            "http://up.enterdesk.com/edpic_source/56/51/c0/5651c08bdb088ba8102b279518b57574.jpg",
            width: 121.w,
            height: 121.w,
          ),
        ),
        // 右侧
        SizedBox(
          width: 194.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // 作者
              Container(
                margin: EdgeInsets.all(0),
                child: Text(
                  item.ipv4Address ?? "",
                  style: TextStyle(
                    fontFamily: 'Avenir',
                    fontWeight: FontWeight.normal,
                    color: AppColors.thirdElementText,
                    fontSize: 14.sp,
                    height: 1,
                  ),
                ),
              ),
              // 标题
              InkWell(
                onTap: () {
                  // ExtendedNavigator.rootNavigator.pushNamed(
                  //   Routes.detailsPageRoute,
                  //   arguments: DetailsPageArguments(item: item),
                  // );
                  Get.toNamed(AppRoutes.DeviceDetail, arguments: item);
                },
                child: Container(
                  margin: EdgeInsets.only(top: 10.h),
                  child: Text(
                    item.deviceSn ?? "",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryText,
                      fontSize: 16.sp,
                      height: 1,
                    ),
                    overflow: TextOverflow.clip,
                    maxLines: 3,
                  ),
                ),
              ),
              // Spacer
              Spacer(),
              // 一行 3 列
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // 分类
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 60.w,
                      ),
                      child: Text(
                        item.loginId.toString(),
                        style: TextStyle(
                          fontFamily: 'Avenir',
                          fontWeight: FontWeight.normal,
                          color: AppColors.secondaryElementText,
                          fontSize: 14.sp,
                          height: 1,
                        ),
                        overflow: TextOverflow.clip,
                        maxLines: 1,
                      ),
                    ),
                    // 添加时间
                    Container(
                      width: 15.w,
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 100.w,
                      ),
                      child: Text(
                        '• ${duTimeLineFormat(item.bootTime ?? DateTime(0))}',
                        style: TextStyle(
                          fontFamily: 'Avenir',
                          fontWeight: FontWeight.normal,
                          color: AppColors.thirdElementText,
                          fontSize: 14.sp,
                          height: 1,
                        ),
                        overflow: TextOverflow.clip,
                        maxLines: 1,
                      ),
                    ),
                    // 更多
                    Spacer(),
                    InkWell(
                      child: Icon(
                        Icons.more_horiz,
                        color: AppColors.primaryText,
                        size: 24.sp,
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
