/// status : "success"
/// message : "New user created.!"
/// userInformation : {"userId":"25","userType":"home","name":"name","phoneNo":"9443011398","alternatePhoneNo":null,"mailId":"tets@gmi.com","companyName":"jajjja","referalCode":"dammm","googleLocation":null,"address":null,"blockNo":null,"floorNo":null,"detailedAddress":null,"deliveryFrequency":null,"referenceNumber":"USRNLIYYQMDZG","noOfCansPerVisit":"0","noOfCansDeposite":"0","brandSelectionStatus":"Pending","userPrice":null,"status":"A","authKey":"hrOXjATSihmto2hUApUcYTCxcGRswXH6","registrationStatus":null,"createdAt":"2022-02-07 07:59:04","updatedAt":"2022-02-07 07:59:04"}

class Signup {
  String _status;
  String _message;
  UserInformation _userInformation;

  String get status => _status;
  String get message => _message;
  UserInformation get userInformation => _userInformation;

  Signup({String status, String message, UserInformation userInformation}) {
    _status = status;
    _message = message;
    _userInformation = userInformation;
  }

  Signup.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _userInformation = json['userInformation'] != null
        ? UserInformation.fromJson(json['userInformation'])
        : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_userInformation != null) {
      map['userInformation'] = _userInformation.toJson();
    }
    return map;
  }
}

class UserInformation {
  String _userId;
  String _userType;
  String _name;
  String _phoneNo;
  dynamic _alternatePhoneNo;
  String _mailId;
  String _companyName;
  String _referalCode;
  dynamic _googleLocation;
  dynamic _address;
  dynamic _blockNo;
  dynamic _floorNo;
  dynamic _detailedAddress;
  dynamic _deliveryFrequency;
  String _referenceNumber;
  String _noOfCansPerVisit;
  String _noOfCansDeposite;
  String _brandSelectionStatus;
  dynamic _userPrice;
  String _status;
  String _authKey;
  dynamic _registrationStatus;
  String _createdAt;
  String _updatedAt;

  String get userId => _userId;
  String get userType => _userType;
  String get name => _name;
  String get phoneNo => _phoneNo;
  dynamic get alternatePhoneNo => _alternatePhoneNo;
  String get mailId => _mailId;
  String get companyName => _companyName;
  String get referalCode => _referalCode;
  dynamic get googleLocation => _googleLocation;
  dynamic get address => _address;
  dynamic get blockNo => _blockNo;
  dynamic get floorNo => _floorNo;
  dynamic get detailedAddress => _detailedAddress;
  dynamic get deliveryFrequency => _deliveryFrequency;
  String get referenceNumber => _referenceNumber;
  String get noOfCansPerVisit => _noOfCansPerVisit;
  String get noOfCansDeposite => _noOfCansDeposite;
  String get brandSelectionStatus => _brandSelectionStatus;
  dynamic get userPrice => _userPrice;
  String get status => _status;
  String get authKey => _authKey;
  dynamic get registrationStatus => _registrationStatus;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;

  UserInformation(
      {String userId,
      String userType,
      String name,
      String phoneNo,
      dynamic alternatePhoneNo,
      String mailId,
      String companyName,
      String referalCode,
      dynamic googleLocation,
      dynamic address,
      dynamic blockNo,
      dynamic floorNo,
      dynamic detailedAddress,
      dynamic deliveryFrequency,
      String referenceNumber,
      String noOfCansPerVisit,
      String noOfCansDeposite,
      String brandSelectionStatus,
      dynamic userPrice,
      String status,
      String authKey,
      dynamic registrationStatus,
      String createdAt,
      String updatedAt}) {
    _userId = userId;
    _userType = userType;
    _name = name;
    _phoneNo = phoneNo;
    _alternatePhoneNo = alternatePhoneNo;
    _mailId = mailId;
    _companyName = companyName;
    _referalCode = referalCode;
    _googleLocation = googleLocation;
    _address = address;
    _blockNo = blockNo;
    _floorNo = floorNo;
    _detailedAddress = detailedAddress;
    _deliveryFrequency = deliveryFrequency;
    _referenceNumber = referenceNumber;
    _noOfCansPerVisit = noOfCansPerVisit;
    _noOfCansDeposite = noOfCansDeposite;
    _brandSelectionStatus = brandSelectionStatus;
    _userPrice = userPrice;
    _status = status;
    _authKey = authKey;
    _registrationStatus = registrationStatus;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  UserInformation.fromJson(dynamic json) {
    _userId = json['userId'];
    _userType = json['userType'];
    _name = json['name'];
    _phoneNo = json['phoneNo'];
    _alternatePhoneNo = json['alternatePhoneNo'];
    _mailId = json['mailId'];
    _companyName = json['companyName'];
    _referalCode = json['referalCode'];
    _googleLocation = json['googleLocation'];
    _address = json['address'];
    _blockNo = json['blockNo'];
    _floorNo = json['floorNo'];
    _detailedAddress = json['detailedAddress'];
    _deliveryFrequency = json['deliveryFrequency'];
    _referenceNumber = json['referenceNumber'];
    _noOfCansPerVisit = json['noOfCansPerVisit'];
    _noOfCansDeposite = json['noOfCansDeposite'];
    _brandSelectionStatus = json['brandSelectionStatus'];
    _userPrice = json['userPrice'];
    _status = json['status'];
    _authKey = json['authKey'];
    _registrationStatus = json['registrationStatus'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['userId'] = _userId;
    map['userType'] = _userType;
    map['name'] = _name;
    map['phoneNo'] = _phoneNo;
    map['alternatePhoneNo'] = _alternatePhoneNo;
    map['mailId'] = _mailId;
    map['companyName'] = _companyName;
    map['referalCode'] = _referalCode;
    map['googleLocation'] = _googleLocation;
    map['address'] = _address;
    map['blockNo'] = _blockNo;
    map['floorNo'] = _floorNo;
    map['detailedAddress'] = _detailedAddress;
    map['deliveryFrequency'] = _deliveryFrequency;
    map['referenceNumber'] = _referenceNumber;
    map['noOfCansPerVisit'] = _noOfCansPerVisit;
    map['noOfCansDeposite'] = _noOfCansDeposite;
    map['brandSelectionStatus'] = _brandSelectionStatus;
    map['userPrice'] = _userPrice;
    map['status'] = _status;
    map['authKey'] = _authKey;
    map['registrationStatus'] = _registrationStatus;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }
}
