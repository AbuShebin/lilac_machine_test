import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:lilac/core/constants/api_constants.dart';
import 'package:lilac/core/utils/errorhandling/failure.dart';
import 'package:lilac/core/utils/errorhandling/type_defs.dart';
import 'package:lilac/features/messages/models/customer_model.dart';

final messagesRepositoryProvider = StateProvider((ref) => MesagesRepository());

class MesagesRepository {
  Dio dio = Dio();
  FutureEither<List<CustomerModel>> getContactUsers() async {
    try {
      print(ApiConstants.chatURl);
      final response = await dio.get("${ApiConstants.chatURl}",options: Options(
    headers: {
      'Authorization': 'Bearer 1356|SkO0fO5rMEXmh4GZ1K9YjXaIShxpfi608I2HvCT51e157730',
    },
  ),);
        print("runtime type = ${response.data}");

      if (response.statusCode == 200) {
        List<CustomerModel> usersList = [];
        print("status code is 2000");

        for (var i in response.data["data"]) {
          print(i.runtimeType);
          usersList.add(CustomerModel.fromJson(i));
        }
        return right(usersList);
      } else {
        throw "something went wrong";
      }
    } catch (e, s) {
      print(e);
      print(s);
      return left(Failure(errMSg: e.toString()));
    }
  }
}
