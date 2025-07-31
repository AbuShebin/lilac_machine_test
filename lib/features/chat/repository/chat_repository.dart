import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lilac/core/utils/errorhandling/type_defs.dart';

final otpServiceProvider = StateProvider((ref) => MesagesRepository());

class MesagesRepository {
 Dio dio = Dio();
FutureEither<bool> ({required String phoneNumber}) async {
  
}

}