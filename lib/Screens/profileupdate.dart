import 'package:aqua/Provider/Profileupdateprovider.dart';
import 'package:aqua/widgets/form_field.dart';
import 'package:aqua/widgets/loader_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileUpdate extends StatefulWidget {
  @override
  _ProfileUpdateState createState() => _ProfileUpdateState();
}

class _ProfileUpdateState extends State<ProfileUpdate> {
  final TextEditingController googlelocController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController blockController = TextEditingController();
  final TextEditingController floorNoController = TextEditingController();
  final TextEditingController detailaddressController = TextEditingController();
  final TextEditingController numberofcanspervisit = TextEditingController();
  String dropdownvalue = '5';
  var items = ['5', '10', '15'];
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueAccent,
        body: Consumer<ProfileProvider>(
          builder: (BuildContext context, ProfileProvider profileProvider,
                  Widget child) =>
              SingleChildScrollView(
            child: Column(
              children: [
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
                              'Profile Update',
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
                                hint: 'Location',
                                prefixIcon: Icons.account_circle,
                                controller: googlelocController,
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
                              hint: 'Address',
                              prefixIcon: Icons.phone,
                              isMobile: true,
                              controller: addressController,
                            ),
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Block Number",
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
                              controller: blockController,
                              inputType: TextInputType.emailAddress,
                              textCapitalization: TextCapitalization.none,
                              /*  validator: (value) {
                                    if (RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(value)) {
                                      return null;
                                    } else {
                                      return 'Enter Valid Email';
                                    }
                                  },*/
                            ),
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Floor No",
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
                              controller: floorNoController,
                              inputType: TextInputType.text,
                              textCapitalization: TextCapitalization.none,
                              /* validator: (value) {
                                if (value == null) {
                                  referalcodeController.text = "notgiven";
                                }
                              },*/
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Detail Address",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          Material(
                            borderRadius: BorderRadius.circular(10),
                            elevation: 5,
                            color: Color(0xff9999ff),
                            child: GlobalFormField(
                              hint: 'Referalcode',
                              prefixIcon: Icons.card_giftcard_rounded,
                              controller: addressController,
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

                          Material(
                            borderRadius: BorderRadius.circular(10),
                            elevation: 5,
                            color: Color(0xff9999ff),
                            child: Row(
                              children: [
                                Icon(Icons.waves),
                                Card(
                                  elevation: 0,
                                  color: Color(0xff9999ff),
                                  child: Text("No Of Cans PerVisit",
                                      style: TextStyle(color: Colors.black45)),
                                ),
                                Spacer(),
                                DropdownButton(
                                  isDense: false,
                                  elevation: 0,
                                  value: dropdownvalue,
                                  icon: Icon(Icons.keyboard_arrow_down),
                                  items: items.map((String items) {
                                    return DropdownMenuItem(
                                        value: items,
                                        child: Text(
                                          items,
                                          style: TextStyle(color: Colors.black),
                                        ));
                                  }).toList(),
                                  onChanged: (String newValue) {
                                    setState(() {
                                      dropdownvalue = newValue;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Material(
                            borderRadius: BorderRadius.circular(10),
                            elevation: 5,
                            color: Color(0xff9999ff),
                            child: Container(
                                width: 350, height: 100, child: Column(Check)),
                          ),

                          SizedBox(
                            height: 10,
                          ),

                          SizedBox(
                            height: 16.0,
                          ),
                          Column(
                            children: [
                              LoaderButton(
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    //signUpotp(signupProvider, context);
                                  } else {
                                    //showSnackBar('Enter Valid Details !');
                                  }
                                },
                                btnTxt: 'Update',
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
        ));
  }

  DropdownMenuItem<int> buildmenuitem(int item) =>
      DropdownMenuItem(value: item, child: Text(item.toString()));
}
