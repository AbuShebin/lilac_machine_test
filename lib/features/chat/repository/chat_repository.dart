import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:japx/japx.dart';
import 'package:lilac/core/constants/api_constants.dart';
import 'package:lilac/core/utils/errorhandling/failure.dart';
import 'package:lilac/core/utils/errorhandling/type_defs.dart';
import 'package:lilac/features/chat/models/chat_message_model.dart';

final chatRepositoryProvider = StateProvider((ref) => ChatRepository());

class ChatRepository {
 Dio dio = Dio();
 FutureEither<List<ChatMessageModel>> getChatBetweenUsers({
  required String userId,
  required String otherUserId,
}) async {
  try {
    final response = await dio.get(
      "${ApiConstants.chatBetweenUsersURl}/$otherUserId/$userId",
      options: Options(
        headers: {
          'Authorization': 'Bearer 1356|SkO0fO5rMEXmh4GZ1K9YjXaIShxpfi608I2HvCT51e157730',
        },
      ),
    );

    if (response.statusCode == 200) {
      final decoded = Japx.decode(response.data);

      final List<ChatMessageModel> messages = (decoded['data'] as List)
          .map((item) => ChatMessageModel.fromJson(item))
          .toList();

      return right(messages);
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