import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lilac/core/provider/customer_model_provider.dart';
import 'package:lilac/features/messages/models/customer_model.dart';
import 'package:lilac/features/messages/repository/home_repository.dart';
final constactControllerProvider = NotifierProvider<ConstactController, int>(
  () => ConstactController(),
);

class ConstactController extends Notifier<int> {
Future<List<CustomerContactListModel>>  getContactUsers() async {
    final userId = ref.read(userIdProvider);
    if(userId == null){
      throw "user id is null";
    }
    final res = await ref.read(messagesRepositoryProvider).getContactUsers();

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
