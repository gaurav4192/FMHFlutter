class ConversationResponseModel {
  ConversationResponseModel({
      this.message, 
      this.data,});

  ConversationResponseModel.fromJson(dynamic json) {
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  String? message;
  List<Data>? data;
ConversationResponseModel copyWith({  String? message,
  List<Data>? data,
}) => ConversationResponseModel(  message: message ?? this.message,
  data: data ?? this.data,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Data {
  Data({
      this.conversationId, 
      this.participantName, 
      this.lastMessage, 
      this.lastMessageTime,});

  Data.fromJson(dynamic json) {
    conversationId = json['conversation_id'];
    participantName = json['participant_name'];
    lastMessage = json['last_message'];
    lastMessageTime = json['last_message_time'];
  }
  num? conversationId;
  String? participantName;
  String? lastMessage;
  String? lastMessageTime;
Data copyWith({  num? conversationId,
  String? participantName,
  String? lastMessage,
  String? lastMessageTime,
}) => Data(  conversationId: conversationId ?? this.conversationId,
  participantName: participantName ?? this.participantName,
  lastMessage: lastMessage ?? this.lastMessage,
  lastMessageTime: lastMessageTime ?? this.lastMessageTime,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['conversation_id'] = conversationId;
    map['participant_name'] = participantName;
    map['last_message'] = lastMessage;
    map['last_message_time'] = lastMessageTime;
    return map;
  }

}