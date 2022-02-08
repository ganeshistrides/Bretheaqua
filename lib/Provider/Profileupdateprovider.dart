import 'package:aqua/Model/profile_update_response.dart';
import 'package:aqua/connection/SharedPreferences.dart';
import 'package:aqua/connection/api_urls.dart';
import 'package:aqua/connection/repository.dart';
import 'package:flutter/cupertino.dart';

class ProfileProvider extends ChangeNotifier {
  bool isLoading = false;
  bool isError = false;
  ProfileUpdateresponse profileUpdateresponse;

  SharedPrefManager premanager = SharedPrefManager();
  void profileAdd() async {
    String username = premanager.getName().toString();
    String email = premanager.getEmail().toString();
    String phonenumber = premanager.getMobile().toString();
    String companyname = premanager.getCompanyName().toString();

    Map<String, String> params = {
      "apiMethod": "profileUpdate",
      "name": username,
      "mailId": email,
      "alternatePhoneNo": phonenumber,
      "companyName": companyname,
      "googleLocation": "testgoogleLocation",
      "address": "testaddress",
      "blockNo": "testblockNo",
      "floorNo": "testfloorNo",
      "detailedAddress": "testdetailedAddress",
      "noOfCansPerVisit": "11",
      "deliveryFrequency": ""
    };

    profileUpdateresponse = ProfileUpdateresponse.fromJson(await loadApi(
        params: params,
        apiUrl: PROFILE_UPDATE,
        onError: (e) {
          isError = true;
        }));

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
