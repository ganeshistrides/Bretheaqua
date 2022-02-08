import 'package:aqua/connection/api_urls.dart';
import 'package:aqua/connection/repository.dart';
import 'package:flutter/material.dart';

class Loginprovider extends ChangeNotifier {
  bool isLoading = false;
  bool isError = false;
  Map<String, dynamic> loginOtpResponse;
  Map<String, dynamic> loginResponse;

  Future<void> signInOtpReq(String mobileNumber) async {
    toggleLoading();

    Map<String, dynamic> params = {
      "apiMethod": "signinOtpRequest",
      "contactNumber": mobileNumber,
    };

    loginResponse = await loadApi(
        params: params,
        apiUrl: SIGN_IN,
        onError: (e) {
          isError = true;
        });
    toggleLoading();
  }

  Future<void> signIn(String mobileNumber, String otp) async {
    toggleLoading();

    Map<String, dynamic> params = {
      "apiMethod": "signin",
      "contactNumber": mobileNumber,
      "otp": otp
    };

    loginOtpResponse = await loadApi(
        params: params,
        apiUrl: SIGN_IN,
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
