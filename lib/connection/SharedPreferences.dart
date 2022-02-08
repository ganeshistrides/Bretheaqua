import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefManager {
  static const AUTH_KEY = "authkey";
  static const IS_LOGGED_IN = "isloggedin";
  static const NAME = "Name";
  static const EMAIL = "email";
  static const MOBILENUMBER = "mobilenm";
  static const USERTYPE = "company";
  static const COMPANYNAME = "breatheaqua";

  setAuthKey(String authKey) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(AUTH_KEY, authKey);
  }

  Future<String> getAuthKey() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(AUTH_KEY) ?? null;
  }

  setLoggedIn(bool isloggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(IS_LOGGED_IN, isloggedIn);
  }

  Future<bool> getLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(IS_LOGGED_IN) ?? false;
  }

  setUserType(String company) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(USERTYPE, company);
  }

  Future<String> getUserType() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(USERTYPE) ?? "";
  }

  setName(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(NAME, name);
  }

  Future<String> getName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(NAME) ?? '';
  }

  setCompanyName(String cname) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(COMPANYNAME, cname);
  }

  Future<String> getCompanyName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(COMPANYNAME) ?? '';
  }

  Future<void> logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  setEmail(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(EMAIL, name);
  }

  Future<String> getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(EMAIL) ?? '';
  }

  setMobile(String mobile) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(MOBILENUMBER, mobile);
  }

  Future<String> getMobile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(MOBILENUMBER) ?? '';
  }
}
