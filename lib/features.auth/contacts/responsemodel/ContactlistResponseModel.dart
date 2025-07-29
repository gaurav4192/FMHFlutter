class ContactlistResponseModel {
  ContactlistResponseModel({
      this.message, 
      this.data,});

  ContactlistResponseModel.fromJson(dynamic json) {
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
ContactlistResponseModel copyWith({  String? message,
  List<Data>? data,
}) => ContactlistResponseModel(  message: message ?? this.message,
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
      this.contactId, 
      this.username, 
      this.email,});

  Data.fromJson(dynamic json) {
    contactId = json['contact_id'];
    username = json['username'];
    email = json['email'];
  }
  num? contactId;
  String? username;
  String? email;
Data copyWith({  num? contactId,
  String? username,
  String? email,
}) => Data(  contactId: contactId ?? this.contactId,
  username: username ?? this.username,
  email: email ?? this.email,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['contact_id'] = contactId;
    map['username'] = username;
    map['email'] = email;
    return map;
  }

}