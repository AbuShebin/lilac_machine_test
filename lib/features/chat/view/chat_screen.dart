import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lilac/core/provider/customer_model_provider.dart';
import 'package:lilac/core/utils/theme/theme.dart';
import 'package:lilac/core/widgets/customTextField_common.dart';
import 'package:lilac/features/chat/provider/chat_provider.dart';

class ChatScreen extends ConsumerWidget {
  final String otherUserID;
  final String userName;

  ChatScreen({
    required this.otherUserID,
    required this.userName,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
        var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    final currentUserId = ref.watch(userIdProvider);

    return Scaffold(
      appBar: AppBar(
  title: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        userName,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      Row(
        children: [
          const Text(
            "Online",
            style: TextStyle(height: 1),
          ),
          const SizedBox(width: 8),
          CircleAvatar(
            radius: h * 0.007,
            backgroundColor: Colors.green,
          ),
        ],
      ),
    ],
  ),
  backgroundColor: Colors.grey[100],
), body: ref.watch(chatAsyncNotifierProvider(otherUserID)).when(
            data: (data) => ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: data.length,
              itemBuilder: (context, index) {
                final message = data[index];
                final isMe = message.senderId.toString() == currentUserId;
                final sentAt = message.sentAt;
                final timeText = sentAt != null
                    ? '${sentAt.hour}:${sentAt.minute.toString().padLeft(2, '0')}'
                    : '';

                return Align(
                  alignment:
                      isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment:
                        isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 4),
                        padding: const EdgeInsets.all(12),
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.7,
                        ),
                        decoration: BoxDecoration(
                          color: isMe
                              ? Palette.signInwithPhoneNumberColor
                              : Colors.blue[300],
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          message.message,
                          style: TextStyle(
                            color: isMe ? Colors.white : Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Row(
                          mainAxisAlignment:isMe? MainAxisAlignment.end:MainAxisAlignment.start,
                          children: [
                            Text(
                              timeText,
                              style: TextStyle(
                                fontSize:  h*0.015,
                                fontWeight: FontWeight.bold,
                                color:  Colors.black87,
                              ),
                            ),
                            Icon(Icons.check,size: h*0.02,)
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            error: (error, _) => Center(child: Text(error.toString())),
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
          floatingActionButton: Padding(
            padding:  EdgeInsets.only(left:  w*0.01,right: w*0.01),
            child:  SizedBox(
            width: w,
            child: TextFormField(
              style: TextStyle(
                fontFamily: 'Urbanist',
                fontSize: w * 0.037,
                color: Palette.blackColor,
              ),
              decoration: InputDecoration(
                hintText: "Enter your message...",
                hintStyle: TextStyle(
                  fontFamily: 'Urbanist',
                  fontSize: w * 0.036,
                  color: Palette.blackColor,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(w * 0.03),
                  borderSide: BorderSide(color: Colors.grey, width: w * 0.01),
                ),
                suffixIcon: Icon(Icons.send),
                
              ),
            ),
          ),
          ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,);
  }
}
