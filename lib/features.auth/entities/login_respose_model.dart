class LoginResposeModel {
  LoginResposeModel({
      this.message, 
      this.token, 
      this.data,});

  LoginResposeModel.fromJson(dynamic json) {
    message = json['message'];
    token = json['token'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? message;
  String? token;
  Data? data;
LoginResposeModel copyWith({  String? message,
  String? token,
  Data? data,
}) => LoginResposeModel(  message: message ?? this.message,
  token: token ?? this.token,
  data: data ?? this.data,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['token'] = token;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      this.id, 
      this.orgId, 
      this.firstName, 
      this.lastName, 
      this.middleName, 
      this.createdDate, 
      this.updateDate, 
      this.deviceType, 
      this.socialLoginType, 
      this.isSocialLogin, 
      this.username, 
      this.password, 
      this.userType, 
      this.isLoginAllowed, 
      this.email,});

  Data.fromJson(dynamic json) {
    id = json['Id'];
    orgId = json['Org_Id'];
    firstName = json['First_Name'];
    lastName = json['Last_Name'];
    middleName = json['Middle_Name'];
    createdDate = json['Created_Date'];
    updateDate = json['Update_Date'];
    deviceType = json['Device_Type'];
    socialLoginType = json['Social_Login_Type'];
    isSocialLogin = json['Is_Social_Login'];
    username = json['Username'];
    password = json['Password'];
    userType = json['User_Type'];
    isLoginAllowed = json['Is_Login_Allowed'];
    email = json['email'];
  }
  int? id;
  String? orgId;
  String? firstName;
  String? lastName;
  String? middleName;
  String? createdDate;
  String? updateDate;
  String? deviceType;
  String? socialLoginType;
  int? isSocialLogin;
  String? username;
  String? password;
  String? userType;
  int? isLoginAllowed;
  String? email;
Data copyWith({  int? id,
  String? orgId,
  String? firstName,
  String? lastName,
  String? middleName,
  String? createdDate,
  String? updateDate,
  String? deviceType,
  String? socialLoginType,
  int? isSocialLogin,
  String? username,
  String? password,
  String? userType,
  int? isLoginAllowed,
  String? email,
}) => Data(  id: id ?? this.id,
  orgId: orgId ?? this.orgId,
  firstName: firstName ?? this.firstName,
  lastName: lastName ?? this.lastName,
  middleName: middleName ?? this.middleName,
  createdDate: createdDate ?? this.createdDate,
  updateDate: updateDate ?? this.updateDate,
  deviceType: deviceType ?? this.deviceType,
  socialLoginType: socialLoginType ?? this.socialLoginType,
  isSocialLogin: isSocialLogin ?? this.isSocialLogin,
  username: username ?? this.username,
  password: password ?? this.password,
  userType: userType ?? this.userType,
  isLoginAllowed: isLoginAllowed ?? this.isLoginAllowed,
  email: email ?? this.email,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = id;
    map['Org_Id'] = orgId;
    map['First_Name'] = firstName;
    map['Last_Name'] = lastName;
    map['Middle_Name'] = middleName;
    map['Created_Date'] = createdDate;
    map['Update_Date'] = updateDate;
    map['Device_Type'] = deviceType;
    map['Social_Login_Type'] = socialLoginType;
    map['Is_Social_Login'] = isSocialLogin;
    map['Username'] = username;
    map['Password'] = password;
    map['User_Type'] = userType;
    map['Is_Login_Allowed'] = isLoginAllowed;
    map['email'] = email;
    return map;
  }

}