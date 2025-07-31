import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lilac/core/provider/customer_model_provider.dart';
import 'package:lilac/core/utils/custom_snackBar.dart';
import 'package:lilac/core/utils/theme/theme.dart';
import 'package:lilac/features/auth/service/otp_service.dart';
import 'package:lilac/features/auth/view/otp_verification_screen.dart';
import 'package:lilac/features/chat/view/chat_screen.dart';
import 'package:lilac/features/contach_users/models/customer_model.dart';
import 'package:lilac/features/contach_users/repository/messages_repository.dart';
import 'package:lilac/features/contach_users/view/contact_users_screen.dart';

final constactControllerProvider = NotifierProvider<ConstactController, int>(
  () => ConstactController(),
);

class ConstactController extends Notifier<int> {
Future<List<CustomerModel>>  getContactUsers() async {
    final userId = ref.read(userIdProvider);
    if(userId == null){
      throw "user id is null";
    }
    final res = await ref.read(messagesRepositoryProvider).getContactUsers(userId:userId);

    return res.fold(
      (l) {
        print("left worked ${l.errMSg}");
        throw Exception(l.errMSg);
        },
      (r){
        print("right workded");
        return r;
      },
    );
  }
 
  @override
  int build() => 0;
}
