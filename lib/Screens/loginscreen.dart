import 'package:aqua/Provider/Loginprovider.dart';
import 'package:aqua/Screens/otp_dialog.dart';
import 'package:aqua/Screens/signupscreen.dart';
import 'package:aqua/connection/SharedPreferences.dart';
import 'package:aqua/widgets/form_field.dart';
import 'package:aqua/widgets/loader_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Loginscreen extends StatelessWidget {
  final TextEditingController mobileNumberController = TextEditingController();
  //final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<Loginprovider>(builder:
        (BuildContext context, Loginprovider loginProvider, Widget child) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Expanded(
                    child: Container(
                  color: Color(0xff99bbff),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 250,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 24.0),
                          ),
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Material(
                                borderRadius: BorderRadius.circular(10),
                                //elevation: 5,
                                color: Color(0xff9999ff),
                                child: GlobalFormField(
                                  hint: 'Mobile',
                                  prefixIcon: Icons.phone_android,
                                  controller: mobileNumberController,
                                  isMobile: true,
                                  validator: (value) {
                                    if ((value.length > 10) ||
                                        (value.length < 10)) {
                                      return 'Please Enter Valid Mobile Number';
                                    }

                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Column(
                          children: [
                            LoaderButton(
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  signInOtpReq(loginProvider, context);
                                }
                              },
                              btnTxt: 'Sign in',
                              //   isLoading: loginProvider.isLoading,
                            ),
                            SizedBox(
                              height: 16.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Don\'t have an account?',
                                  style: TextStyle(color: Colors.white),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignUpScreen()),
                                    );
                                    /*Navigator.pushNamed(
                                        context, SignUpScreen.routeName);*/
                                  },
                                  child: Text(
                                    ' Sign Up',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 16.0,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ))
              ],
            ),
          ),
        ),
      );
    });
  }

  void signInOtpReq(Loginprovider loginProvider, BuildContext context) async {
    await loginProvider.signInOtpReq(mobileNumberController.text);

    if (loginProvider.loginResponse['status'] == 'error') {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return OTPDialog(
                mobileNumber: mobileNumberController.text,
                onVerified: () {
                  // Navigator.pop(context);
                  signIn(loginProvider, context);
                },
                onRetryClick: () async => await loginProvider
                    .signInOtpReq(mobileNumberController.text));
          }).then((value) {});
    } else {
      //showSnackBar(signUpProvider.signupotpResponse['status'] == 'error');
    }
  }

  void signIn(Loginprovider loginProvider, BuildContext context) async {
    await loginProvider.signIn(
        mobileNumberController.text, loginProvider.loginResponse['otp']);
    if (loginProvider.loginOtpResponse['status'] == 'success') {
      SharedPrefManager prefManger = SharedPrefManager();
      await prefManger.setLoggedIn(true);

    } else {
      //showSnackBar(loginProvider.loginResponsedata.message, context);
    }
  }
}
