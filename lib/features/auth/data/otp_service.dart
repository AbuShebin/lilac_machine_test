import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:lilac/core/constants/api_constants.dart';
import 'package:lilac/core/utils/errorhandling/failure.dart';
import 'package:lilac/core/utils/errorhandling/type_defs.dart';

final otpServiceProvider = StateProvider((ref) => OtpService());

class OtpService {
 Dio dio = Dio();
FutureEither<bool> sendOtp({required String phoneNumber}) async {
  try {

    final response = await dio.post(ApiConstants.sendOtpUrl,data: {
    "data": {
        "type": "registration_otp_codes",
        "attributes": {
            "phone": "+91$phoneNumber"
        }
    }
    });

    if (response.statusCode == 200) {
      if(response.data["status"]==true){
        return right(true);
      }else{
        return left(Failure(errMSg: response.data["message"]));
      }
    } else {
      throw "something went wrong";
    }
  } catch (e) {
    return left(Failure(errMSg: e.toString()));
  }
}

FutureEither<bool> verifyOtp({required String phoneNumber, required int otp}) async {
  try {
    final response = await dio.post(
      ApiConstants.verifyOtpUrl,
      data: {
        "data": {
          "type": "registration_otp_codes",
          "attributes": {
            "phone": "+91$phoneNumber",
            "otp": otp,
            "device_meta": {
              "type": "web",
              "device-name": "HP Pavilion 14-EP0068TU",
              "device-os-version": "Linux x86_64",
              "browser": "Mozilla Firefox Snap for Ubuntu (64-bit)",
              "browser_version": "112.0.2",
              "user-agent":
                  "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/112.0",
              "screen_resolution": "1600x900",
              "language": "en-GB"
            }
          }
        }
      },
    );

   if (response.statusCode == 200) {
  final res = response.data;

  if (res['status'] == true) {

    return right(true);
  } else {
    return left(Failure(errMSg: res['message'] ?? 'Unknown error'));
  }
}else{
    final res = response.data;
print(res["error"]["message"]);
  return left(Failure(errMSg: res["error"]["message"]));
}
  } catch (e) {
    return left(Failure(errMSg: e.toString()));
  }
}

}
