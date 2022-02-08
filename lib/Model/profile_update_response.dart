/// status : "success"
/// message : "Profile Updated.!"

class ProfileUpdateresponse {
  String _status;
  String _message;

  String get status => _status;
  String get message => _message;

  ProfileUpdateresponse({String status, String message}) {
    _status = status;
    _message = message;
  }

  ProfileUpdateresponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    return map;
  }
}
