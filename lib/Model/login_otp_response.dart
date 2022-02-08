class LoginOtpResponse {
  String status;
  String message;
  UserInformation userInformations;

  LoginOtpResponse({this.status, this.message, this.userInformations});

  LoginOtpResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    userInformations = json['userInformations'] != null
        ? new UserInformation.fromJson(json['userInformations'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.userInformations != null) {
      data['userInformations'] = this.userInformations.toJson();
    }
    return data;
  }
}

class UserInformation {
  UserInformation({
    this.userId,
    this.userType,
    this.name,
    this.phoneNo,
    this.alternatePhoneNo,
    this.mailId,
    this.companyName,
    this.referalCode,
    this.googleLocation,
    this.address,
    this.blockNo,
    this.floorNo,
    this.detailedAddress,
    this.deliveryFrequency,
    this.referenceNumber,
    this.noOfCansPerVisit,
    this.noOfCansDeposite,
    this.userPrice,
    this.status,
    this.authKey,
    this.registrationStatus,
    this.createdAt,
    this.updatedAt,
  });

  String userId;
  String userType;
  String name;
  String phoneNo;
  dynamic alternatePhoneNo;
  String mailId;
  String companyName;
  String referalCode;
  dynamic googleLocation;
  dynamic address;
  dynamic blockNo;
  dynamic floorNo;
  dynamic detailedAddress;
  dynamic deliveryFrequency;
  String referenceNumber;
  String noOfCansPerVisit;
  String noOfCansDeposite;
  dynamic userPrice;
  String status;
  String authKey;
  dynamic registrationStatus;
  DateTime createdAt;
  DateTime updatedAt;

  factory UserInformation.fromJson(Map<String, dynamic> json) =>
      UserInformation(
        userId: json["userId"],
        userType: json["userType"],
        name: json["name"],
        phoneNo: json["phoneNo"],
        alternatePhoneNo: json["alternatePhoneNo"],
        mailId: json["mailId"],
        companyName: json["companyName"],
        referalCode: json["referalCode"],
        googleLocation: json["googleLocation"],
        address: json["address"],
        blockNo: json["blockNo"],
        floorNo: json["floorNo"],
        detailedAddress: json["detailedAddress"],
        deliveryFrequency: json["deliveryFrequency"],
        referenceNumber: json["referenceNumber"],
        noOfCansPerVisit: json["noOfCansPerVisit"],
        noOfCansDeposite: json["noOfCansDeposite"],
        userPrice: json["userPrice"],
        status: json["status"],
        authKey: json["authKey"],
        registrationStatus: json["registrationStatus"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "userType": userType,
        "name": name,
        "phoneNo": phoneNo,
        "alternatePhoneNo": alternatePhoneNo,
        "mailId": mailId,
        "companyName": companyName,
        "referalCode": referalCode,
        "googleLocation": googleLocation,
        "address": address,
        "blockNo": blockNo,
        "floorNo": floorNo,
        "detailedAddress": detailedAddress,
        "deliveryFrequency": deliveryFrequency,
        "referenceNumber": referenceNumber,
        "noOfCansPerVisit": noOfCansPerVisit,
        "noOfCansDeposite": noOfCansDeposite,
        "userPrice": userPrice,
        "status": status,
        "authKey": authKey,
        "registrationStatus": registrationStatus,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
