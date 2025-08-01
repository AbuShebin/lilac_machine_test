import 'package:lilac/features/chat/models/chat_attributes_model.dart';

class ChatMessageModel {
  final String id;
  final String type;
  final ChatMessageAttributes attributes;

  ChatMessageModel({
    required this.id,
    required this.type,
    required this.attributes,
  });

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) {
    return ChatMessageModel(
      id: json['id'],
      type: json['type'],
      attributes: ChatMessageAttributes.fromJson(json['attributes']),
    );
  }
}
