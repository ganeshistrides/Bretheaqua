import 'package:aqua/connection/api_urls.dart';
import 'package:aqua/connection/repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SignupProvider extends ChangeNotifier {
  bool isLoading = false;
  bool isError = false;

  Map<String, dynamic> signupotpResponse;
  Map<String, dynamic> signup;

  Future<void> signupotprequest(
    String contactNumber,
    String name,
    String mailId,
  ) async {
    Map<String, String> params = {
      "apiMethod": "signupOtpRequest",
      "contactNumber": contactNumber,
      "name": name,
      "mailId": mailId,
    };

    signupotpResponse = await loadApi(
        params: params,
        apiUrl: SIGN_UP,
        onError: (e) {
          isError = true;
        });
    toggleLoading();
  }

/*  Future<void> signupresponsedata(
      String contactNumber,
      String name,
      String mailId,
      String referalCode,
      bool userType,
      String companyName,
      String otp) async {
    Map<String, String> params = {
      "apiMethod": "signup",
      "contactNumber": contactNumber,
      "name": name,
      "mailId": mailId,
      "referalCode": referalCode,
      "userType": userType.toString(),
      "companyName": companyName,
      "otp": otp
    };
    signupresponse = Signup.fromJson(await loadApi(
        params: params,
        apiUrl: SIGN_UP,
        onError: (e) {
          isError = true;
        }));
    toggleLoading();
  }*/

  Future<void> signupre(String contactNumber, String name, String mailId,
      String referalCode, bool userType, String companyName, String otp) async {
    Map<String, String> params = {
      "apiMethod": "signup",
      "contactNumber": contactNumber,
      "name": name,
      "mailId": mailId,
      "referalCode": referalCode,
      "userType": userType.toString(),
      "companyName": companyName,
      "otp": otp
    };

    signup = await loadApi(
        params: params,
        apiUrl: SIGN_UP,
        onError: (e) {
          isError = true;
        });
    toggleLoading();
  }

  toggleLoading() {
    isLoading = !isLoading;
    if (isLoading) {
      isError = false;
    }
    notifyListeners();
  }
}
