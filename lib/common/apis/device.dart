import 'package:stone/common/entities/device.dart';
import 'package:stone/common/entities/request.dart';
import 'package:stone/common/utils/http.dart';
import 'package:stone/common/values/values.dart';

/// 设备接口
class DeviceAPI {
  /// 翻页
  /// refresh 是否刷新
  static Future<DevicePageListResponseEntity> devicePageList({
    DevicePageListRequestEntity? params,
    bool refresh = false,
    bool cacheDisk = false,
  }) async {
    var response = await HttpUtil().get(
      '/api/device/getDeviceSearchInfoList',
      queryParameters: params?.toJson(),
      refresh: refresh,
      cacheDisk: cacheDisk,
      cacheKey: STORAGE_INDEX_DEVICE_CACHE_KEY,
    );
    final map = response['data']['items'] as List;
    print("毁掉: ${map.length}");
    return DevicePageListResponseEntity.fromJson(response);
  }

  // 设备登录
  static Future<ResponseResult> deviceLogin({
    RequestLoginParams? params,
    bool refresh = false,
    bool cacheDisk = false,
  }) async {
    print("发起请求: $params");
    var response = await HttpUtil().post(
      '/api/device/login',
      data: params?.toJson(),
    );
    print("返回结果: $response");
    return ResponseResult.fromJson(response);
  }

  // 设备注销
  static Future<ResponseResult> deviceClean({
    String? ipv4Address,
    bool refresh = false,
    bool cacheDisk = false,
  }) async {
    print("发起请求: $ipv4Address");
    var response = await HttpUtil().post(
      '/api/device/clean/$ipv4Address',
    );
    print("返回结果: $response");
    return ResponseResult.fromJson(response);
  }
}
