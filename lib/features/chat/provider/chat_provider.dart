import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lilac/features/chat/controller/chat_controller.dart';
import 'package:lilac/features/chat/models/chat_message_model.dart';

final chatAsyncNotifierProvider = AutoDisposeAsyncNotifierProviderFamily<
    ChatNotifierProvider, List<ChatMessageModel>, String>(
  () => ChatNotifierProvider(),
);

class ChatNotifierProvider
    extends AutoDisposeFamilyAsyncNotifier<List<ChatMessageModel>, String> {
  @override
  FutureOr<List<ChatMessageModel>> build(String otherUserId) {
    return ref
        .read(chatControllerProvider.notifier)
        .getChatBetweenUsers(otherUserId: otherUserId);
  }
}

