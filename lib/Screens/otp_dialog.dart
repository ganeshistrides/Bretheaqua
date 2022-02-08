import 'dart:async';

import 'package:aqua/Provider/Loginprovider.dart';
import 'package:aqua/widgets/loader_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class OTPDialog extends StatefulWidget {
  final String mobileNumber;
  final Function onVerified;
  final Function onRetryClick;
  OTPDialog({this.mobileNumber, this.onVerified, this.onRetryClick});
  @override
  _OTPDialogState createState() => _OTPDialogState();
}

class _OTPDialogState extends State<OTPDialog> {
  TextEditingController pinController = TextEditingController();
/*
  StreamController<ErrorAnimationType> errorController =
      StreamController<ErrorAnimationType>();*/

  Timer _timer;

  int _start = 60;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /*  return Consumer<SignUpProvider>(builder:
        (BuildContext context, SignUpProvider signUpProvider, Widget child) {*/
    return SingleChildScrollView(
      child: Container(
        padding:
            //    EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            EdgeInsets.all(0),
        child: Material(
          color: Colors.transparent,
          child: Container(
            color: Colors.transparent,
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(16.0)),
                      child: Column(
                        children: [
                          /*SizedBox(
                            height: MediaQuery.of(context).size.height / 3.5,
                          ),*/
                          SvgPicture.asset(
                            'assets/otp_illus.svg',
                            width: 250.0,
                            height: 320.0,
                          ),
                          Text(
                            'OTP Verification',
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w800),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Enter OTP code sent to',
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                              Text(
                                ' ${widget.mobileNumber}',
                                style: TextStyle(fontWeight: FontWeight.w800),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 24.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(36.0),
                            child: PinCodeTextField(
                              length: 5,
                              controller: pinController,
                              animationType: AnimationType.fade,
                              onChanged: (String value) {},
                              appContext: context,
                              enableActiveFill: true,
                              keyboardType: TextInputType.number,
                              //errorAnimationController: errorController,
                              pinTheme: PinTheme(
                                shape: PinCodeFieldShape.box,
                                borderRadius: BorderRadius.circular(5),
                                fieldHeight: 50,
                                fieldWidth: 40,
                                activeColor: Colors.black,
                                inactiveColor: Colors.black,
                                selectedColor: Colors.green,
                                selectedFillColor:
                                    Colors.black.withOpacity(0.2),
                                inactiveFillColor:
                                    Colors.black.withOpacity(0.2),
                                activeFillColor: Colors.black.withOpacity(0.2),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: false,
                            child: Text("111"
                                /* '${signUpProvider.requestOtpResponse['otp']}',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w800),*/
                                ),
                          ),
                          SizedBox(
                            height: 24.0,
                          ),
                          Text(
                            'Didn\'t recieve OTP code?',
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Consumer<Loginprovider>(
                            builder: (BuildContext context,
                                    Loginprovider loginProvider,
                                    Widget child) =>
                                Stack(
                              children: [
                                Visibility(
                                    visible: loginProvider.isLoading,
                                    child: SizedBox(
                                      width: 24.0,
                                      height: 24.0,
                                      child: CircularProgressIndicator(),
                                    )),
                                Consumer<Loginprovider>(
                                  builder: (BuildContext context,
                                          Loginprovider loginProvider,
                                          Widget child) =>
                                      Opacity(
                                    opacity: 1,
                                    child: InkWell(
                                      onTap: () async {
                                        if (_start == 0) {
                                          //await widget.onRetryClick();
                                          _start = 10;
                                          startTimer();
                                        }
                                      },
                                      child: Text(
                                        _start == 0
                                            ? 'Retry'
                                            : 'Retry in $_start seconds',
                                        style: TextStyle(
                                            color: _start == 0
                                                ? Colors.black
                                                : null,
                                            decoration: _start == 0
                                                ? TextDecoration.underline
                                                : null,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 36.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                Consumer<Loginprovider>(
                                  builder: (BuildContext context,
                                          Loginprovider loginProvider,
                                          Widget child) =>
                                      Expanded(
                                          child: LoaderButton(
                                    onPressed: () {
                                      if (pinController.text ==
                                          loginProvider.loginResponse['otp']) {
                                        //print(loginProvider.loginResponse.otp);

                                        widget.onVerified();
                                      } else {
                                        /*errorController
                                              .add(ErrorAnimationType.shake);*/
                                      }
                                    },
                                    btnTxt: 'Verify & Proceed',
                                  )),
                                ),
                                SizedBox(
                                  width: 4.0,
                                ),
                                Expanded(
                                    child: LoaderButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  btnTxt: 'Cancel',
                                )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    //  });
  }
}