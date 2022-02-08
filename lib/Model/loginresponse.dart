/// status : "error"
/// message : "Otp sent to the registed mobile number.!"
/// otp : "69188"

class Loginresponse {
  String _status;
  String _message;
  String _otp;

  String get status => _status;
  String get message => _message;
  String get otp => _otp;

  Loginresponse({String status, String message, String otp}) {
    _status = status;
    _message = message;
    _otp = otp;
  }

  Loginresponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    map['otp'] = _otp;
    return map;
  }
}
