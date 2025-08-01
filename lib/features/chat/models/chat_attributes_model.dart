class ChatMessageAttributes {
  final int chatThreadId;
  final int chatMessageTypeId;
  final int senderId;
  final int receiverId;
  final String message;
  final bool isOneTimeView;
  final bool isReadReceiptsOn;
  final bool isOnVanishMode;
  final DateTime? sentAt;
  final DateTime? deliveredAt;
  final DateTime? viewedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? mediaUrl;

  ChatMessageAttributes({
    required this.chatThreadId,
    required this.chatMessageTypeId,
    required this.senderId,
    required this.receiverId,
    required this.message,
    required this.isOneTimeView,
    required this.isReadReceiptsOn,
    required this.isOnVanishMode,
    this.sentAt,
    this.deliveredAt,
    this.viewedAt,
    this.createdAt,
    this.updatedAt,
    this.mediaUrl,
  });

  factory ChatMessageAttributes.fromJson(Map<String, dynamic> json) {
    return ChatMessageAttributes(
      chatThreadId: json['chat_thread_id'],
      chatMessageTypeId: json['chat_message_type_id'],
      senderId: json['sender_id'],
      receiverId: json['receiver_id'],
      message: json['message'],
      isOneTimeView: json['is_one_time_view'],
      isReadReceiptsOn: json['is_read_receipts_on'] == 1,
      isOnVanishMode: json['is_on_vanish_mode'],
      sentAt: _parseDate(json['sent_at']),
      deliveredAt: _parseDate(json['delivered_at']),
      viewedAt: _parseDate(json['viewed_at']),
      createdAt: _parseDate(json['created_at']),
      updatedAt: _parseDate(json['updated_at']),
      mediaUrl: json['media_url'],
    );
  }

  static DateTime? _parseDate(dynamic val) {
    if (val == null || val is! String) return null;
    return DateTime.tryParse(val);
  }
}
