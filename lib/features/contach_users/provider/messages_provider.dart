

import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lilac/features/contach_users/controller/contact_users_controller.dart';
import 'package:lilac/features/contach_users/models/customer_model.dart';

final messagesAsyncNotifierProvider = AutoDisposeAsyncNotifierProvider<MessagesNotifierProvider, List<CustomerModel>>(
  () {
    return MessagesNotifierProvider();
  },
);

class MessagesNotifierProvider
    extends AutoDisposeAsyncNotifier<List<CustomerModel>> {
  @override
  FutureOr<List<CustomerModel>> build() {
    return fetchContactUsers();
  }

  fetchContactUsers(){
   return ref.read(constactControllerProvider.notifier).getContactUsers();
  }

}
