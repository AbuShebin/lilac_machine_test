

import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lilac/features/messages/controller/contact_users_controller.dart';
import 'package:lilac/features/messages/models/customer_model.dart';

final messagesAsyncNotifierProvider = AutoDisposeAsyncNotifierProvider<MessagesNotifierProvider, List<CustomerContactListModel>>(
  () {
    return MessagesNotifierProvider();
  },
);

class MessagesNotifierProvider
    extends AutoDisposeAsyncNotifier<List<CustomerContactListModel>> {
  @override
  FutureOr<List<CustomerContactListModel>> build() {
    return fetchContactUsers();
  }

  fetchContactUsers(){
   return ref.read(constactControllerProvider.notifier).getContactUsers();
  }

}
