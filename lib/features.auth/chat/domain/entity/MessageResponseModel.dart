class MessageResponseModel {
  MessageResponseModel({
      this.message, 
      this.data,});

  MessageResponseModel.fromJson(dynamic json) {
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
MessageResponseModel copyWith({  String? message,
  List<Data>? data,
}) => MessageResponseModel(  message: message ?? this.message,
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
      this.id, 
      this.content, 
      this.senderId, 
      this.conversationId, 
      this.createdAt,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    content = json['content'];
    senderId = json['sender_id'];
    conversationId = json['conversation_id'];
    createdAt = json['created_at'];
  }
  num? id;
  String? content;
  num? senderId;
  num? conversationId;
  String? createdAt;
Data copyWith({  num? id,
  String? content,
  num? senderId,
  num? conversationId,
  String? createdAt,
}) => Data(  id: id ?? this.id,
  content: content ?? this.content,
  senderId: senderId ?? this.senderId,
  conversationId: conversationId ?? this.conversationId,
  createdAt: createdAt ?? this.createdAt,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['content'] = content;
    map['sender_id'] = senderId;
    map['conversation_id'] = conversationId;
    map['created_at'] = createdAt;
    return map;
  }

}