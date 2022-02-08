import 'package:aqua/Provider/signupprovider.dart';
import 'package:aqua/Screens/profileupdate.dart';
import 'package:aqua/Screens/sign_up_otp_dialog.dart';
import 'package:aqua/connection/SharedPreferences.dart';
import 'package:aqua/widgets/form_field.dart';
import 'package:aqua/widgets/loader_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController companyNameController =
      TextEditingController(text: 'Individual');
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController referalcodeController =
      TextEditingController(text: 'Referalcode');
  bool value = false;

  final _formKey = GlobalKey<FormState>();

  bool isCompany = false;
  showSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body:
          /*Center(
            child: CircularProgressIndicator(),
          ):*/
          Consumer<SignupProvider>(
        builder: (BuildContext context, SignupProvider signupProvider,
                Widget child) =>
            SingleChildScrollView(
          child: Column(
            children: [
              /*Container(
                height: MediaQuery.of(context).size.height * 0.2,
                child: Stack(
                  children: [
                    //LoginScreenBg(),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Card(
                                  //color: Colors.black,
                                  shape: CircleBorder(),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Icon(
                                      Icons.chevron_left,
                                      // color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            */ /*Text(
                              'Create Account',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 24.0),
                            ),*/ /*
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),*/
              Container(
                color: Color(0xff99bbff),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 24.0),
                          ),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        //logoUploadForm,
                        SizedBox(
                          height: 32.0,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Username",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(10),
                          elevation: 5,
                          color: Color(0xff9999ff),
                          child: GlobalFormField(
                              hint: 'User Name',
                              prefixIcon: Icons.account_circle,
                              controller: nameController,
                              textCapitalization: TextCapitalization.words,
                              validator: (value) {
                                if (value.length < 3) {
                                  return 'Enter Valid User Name';
                                }
                                return null;
                              }),
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Mobile Number",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(10),
                          elevation: 5,
                          color: Color(0xff9999ff),
                          child: GlobalFormField(
                              hint: 'Mobile Number',
                              prefixIcon: Icons.phone,
                              isMobile: true,
                              controller: mobileNumberController,
                              validator: (value) {
                                if ((value.length < 10) ||
                                    (value.length > 10)) {
                                  return 'Enter Valid Mobile Number';
                                }
                                return null;
                              }),
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Email",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(10),
                          elevation: 5,
                          color: Color(0xff9999ff),
                          child: GlobalFormField(
                            hint: 'Email',
                            prefixIcon: Icons.mail,
                            controller: emailController,
                            inputType: TextInputType.emailAddress,
                            textCapitalization: TextCapitalization.none,
                            validator: (value) {
                              if (RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value)) {
                                return null;
                              } else {
                                return 'Enter Valid Email';
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Referal COde",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(10),
                          elevation: 5,
                          color: Color(0xff9999ff),
                          child: GlobalFormField(
                            hint: 'Referalcode',
                            prefixIcon: Icons.card_giftcard_rounded,
                            controller: referalcodeController,
                            inputType: TextInputType.text,
                            textCapitalization: TextCapitalization.none,
                            /* validator: (value) {
                              if (value == null) {
                                referalcodeController.text = "notgiven";
                              }
                            },*/
                          ),
                        ),
                        SizedBox(
                          height: 16.0,
                        ),

                        CheckboxListTile(
                          value: isCompany,
                          onChanged: (bool value) {
                            isCompany = !isCompany;
                            setState(() {
                              this.value = value;
                            });
                          },
                          title: Text('Are you a Company ? '),
                        ),
                        Visibility(
                          visible: value,
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Company Name",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Visibility(
                          visible: value,
                          child: Material(
                            borderRadius: BorderRadius.circular(10),
                            elevation: 5,
                            color: Color(0xff9999ff),
                            child: GlobalFormField(
                              hint: 'Company Name',
                              isEnabled: true,
                              prefixIcon: Icons.account_circle,
                              controller: companyNameController,
                              textCapitalization: TextCapitalization.words,
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 16.0,
                        ),
                        Column(
                          children: [
                            LoaderButton(
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  signUpotp(signupProvider, context);
                                } else {
                                  showSnackBar('Enter Valid Details !');
                                }
                              },
                              btnTxt: 'Sign Up',
                              isLoading: false,
                            ),
                            SizedBox(
                              height: 16.0,
                            ),
                            SizedBox(
                              height: 16.0,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void signUp(SignupProvider signupProvider, BuildContext context) async {
    await signupProvider.signupre(
        mobileNumberController.text,
        nameController.text,
        emailController.text,
        referalcodeController.text,
        isCompany,
        companyNameController.text,
        signupProvider.signupotpResponse['otp']);

    if (signupProvider.signupotpResponse['status'] == "success") {
      SharedPrefManager prefManger = SharedPrefManager();
      prefManger.setLoggedIn(true);
      print(prefManger.getLoggedIn());
      prefManger
          .setAuthKey(signupProvider.signup['userInformation']['authKey']);
      await prefManger.setCompanyName(companyNameController.text);
      await prefManger.setEmail(emailController.text);
      await prefManger.setMobile(mobileNumberController.text);
      await prefManger.setUserType(isCompany.toString());
      await prefManger.setName(nameController.text);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfileUpdate()),
      );
      /*showDialog(
          context: context,
          builder: (BuildContext context) {
            return Text("ganehs");
          });*/
    } else {
      //showSnackBar(loginProvider.loginResponsedata.message, context);
    }
  }

  void signUpotp(SignupProvider signUpProvider, BuildContext context) async {
    await signUpProvider.signupotprequest(
        mobileNumberController.text, nameController.text, emailController.text);

    if (signUpProvider.signupotpResponse['status'] == 'success') {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return SignUpOTPDialog(
              mobileNumber: mobileNumberController.text,
              onVerified: () {
                // Navigator.pop(context);
                signUp(signUpProvider, context);
              },
              onRetryClick: () async {
                await signUpProvider.signupotprequest(
                    mobileNumberController.text,
                    nameController.text,
                    emailController.text);
              },
            );
          }).then((value) {});
    } else {
      //showSnackBar(signUpProvider.signupotpResponse['status'] == 'error');
    }
  }

/*  void signUpotp(SignupProvider signupProvider, BuildContext context) async {
    await signupProvider.signupotprequest(
        mobileNumberController.text, nameController.text, emailController.text);
  }*/
}
