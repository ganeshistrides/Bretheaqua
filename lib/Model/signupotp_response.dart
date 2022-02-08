/// status : "error"
/// message : "Otp sent to the registed mobile number.!"
/// otp : "45376"

class SignupotpResponse {
  String _status;
  String _message;
  String _otp;

  String get status => _status;
  String get message => _message;
  String get otp => _otp;

  SignupotpResponse({String status, String message, String otp}) {
    _status = status;
    _message = message;
    _otp = otp;
  }

  SignupotpResponse.fromJson(dynamic json) {
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
