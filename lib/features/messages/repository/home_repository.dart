import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:lilac/core/constants/api_constants.dart';
import 'package:lilac/core/utils/errorhandling/failure.dart';
import 'package:lilac/core/utils/errorhandling/type_defs.dart';
import 'package:lilac/features/messages/models/customer_model.dart';
import 'package:japx/japx.dart';


final messagesRepositoryProvider = StateProvider((ref) => MesagesRepository());

class MesagesRepository {
  Dio dio = Dio();


FutureEither<List<CustomerContactListModel>> getContactUsers() async {
  try {
    final response = await dio.get(
      ApiConstants.chatURl,
      options: Options(
        headers: {
          'Authorization': 'Bearer 1356|SkO0fO5rMEXmh4GZ1K9YjXaIShxpfi608I2HvCT51e157730',
        },
      ),
    );

    if (response.statusCode == 200) {
      final rawList = response.data['data'] as List;

      final usersList = rawList.map((item) {
        final flattened = Japx.decode({'data': item});
        return CustomerContactListModel.fromJson(flattened['data']);
      }).toList();

      return right(usersList);
    } else {
      return left(Failure(errMSg: 'Unexpected status code: ${response.statusCode}'));
    }
  } catch (e, s) {
    print(e);
    print(s);
    return left(Failure(errMSg: e.toString()));
  }
}
}
