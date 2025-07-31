import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Simple data model
class ChatMessage {
  final String message;
  final String senderName;
  final int senderId;
  final DateTime sentAt;

  ChatMessage({
    required this.message,
    required this.senderName,
    required this.senderId,
    required this.sentAt,
  });
}

// Sample data from your API
final sampleMessages = [
  ChatMessage(
    message: "mm",
    senderName: "amrutha",
    senderId: 81,
    sentAt: DateTime.parse("2025-04-06T18:53:32.000000Z"),
  ),
  ChatMessage(
    message: "Hello! How are you doing?",
    senderName: "John Doe",
    senderId: 55,
    sentAt: DateTime.parse("2025-04-06T19:00:00.000000Z"),
  ),
  ChatMessage(
    message: "I'm doing great! Thanks for asking.",
    senderName: "amrutha",
    senderId: 81,
    sentAt: DateTime.parse("2025-04-06T19:05:00.000000Z"),
  ),
];

// Riverpod provider
final messagesProvider = Provider<List<ChatMessage>>((ref) => sampleMessages);
final currentUserIdProvider = Provider<int>((ref) => 55);

class ChatScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messages = ref.watch(messagesProvider);
    final currentUserId = ref.watch(currentUserIdProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final message = messages[index];
          final isMe = message.senderId == currentUserId;
          
          return Align(
            alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.only(bottom: 12),
              padding: EdgeInsets.all(12),
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.7,
              ),
              decoration: BoxDecoration(
                color: isMe ? Colors.blue : Colors.grey[300],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    message.message,
                    style: TextStyle(
                      color: isMe ? Colors.white : Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '${message.senderName} • ${message.sentAt.hour}:${message.sentAt.minute.toString().padLeft(2, '0')}',
                    style: TextStyle(
                      fontSize: 11,
                      color: isMe ? Colors.white70 : Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}