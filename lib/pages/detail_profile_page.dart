
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel/core/utils/app_account_controller.dart';
import 'package:travel/core/values/colors.dart';
// import 'package:travel/lib/core/utils/app_account_controller.dart';
//
// import '../lib/core/values/colors.dart';

class DetailprofilePage extends StatefulWidget {
  DetailprofilePage({super.key});

  @override
  State<DetailprofilePage> createState() => _DetailprofilePageState();
}

class _DetailprofilePageState extends State<DetailprofilePage> {
  final AccountController accountController = Get.put(AccountController());

  final _fullnameController = TextEditingController();

  final _genderController = TextEditingController();

  final _phonenumberController = TextEditingController();

  GenderLabel? selectedGender;

  final List<String> genders = ['Male', 'Female', 'Other'];
  bool checkEditInf = false;
  bool checkEditpass = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryFullBgColor,
      appBar: AppBar(
        title: Text(
          "Persionnal Information",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: Obx(() {
        return Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Thông tin cá nhân'),
                            checkEditInf == false
                                ? TextButton(
                                    onPressed: () async {
                                      setState(() {
                                        checkEditInf = true;
                                      });
                                      print('${checkEditInf}');
                                    },
                                    child: Text('Edit'))
                                : TextButton(
                                    onPressed: () async {
                                      setState(() {
                                        checkEditInf = false;
                                      });
                                      // // Update the fullname, gender, and phonenumber in the controller with the values from the text fields
                                      // accountController.username.value =
                                      //     _fullnameController.text;
                                      // accountController.sex.value =
                                      //     _genderController.text;
                                      // accountController.phonenumber.value =
                                      //     _phonenumberController.text;
                                      await accountController.UpdateUser(
                                          accountController.id.value,
                                          _fullnameController.text,
                                          _genderController.text,
                                          _phonenumberController.text);
                                      await accountController.getAccount(
                                          accountController.email.value);
                                      print('${checkEditInf}');
                                    },
                                    child: Text('Save'))
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      Container(
                        height: 35,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Full Name'),
                            checkEditInf == false
                                ? Text('${accountController.username}')
                                : Container(
                                    width: 300,
                                    child: TextField(
                                      textAlign: TextAlign.right,
                                      autofocus: true,
                                      controller: _fullnameController
                                        ..text = accountController.username.value,
                                      decoration: InputDecoration(
                                        border: UnderlineInputBorder(),
                                        hintText: 'Enter username',
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                        thickness: 0.5,
                      ),
                      Container(
                        height: 35,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Gender'),
                            checkEditInf == false
                                ? Text('${accountController.sex}')
                                : Container(
                                    width: 100,
                                    height: 35,
                                    child: DropdownMenu<GenderLabel>(
                                      initialSelection: GenderLabel.male,
                                      controller: _genderController,
                                      // requestFocusOnTap: true,
                                      // label: const Text('Gender'),
                                      onSelected: (GenderLabel? gender) {
                                        setState(() {
                                          selectedGender = gender;
                                        });
                                      },
                                      dropdownMenuEntries: GenderLabel.values
                                          .map<DropdownMenuEntry<GenderLabel>>(
                                              (GenderLabel gender) {
                                        return DropdownMenuEntry<GenderLabel>(
                                          value: gender,
                                          label: gender.label,
                                          leadingIcon: Icon(gender.icon),
                                        );
                                      }).toList(),
                                      inputDecorationTheme: InputDecorationTheme(
                                          border: InputBorder.none),
                                    ),
                                  ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                        thickness: 0.5,
                      ),
                      Container(
                        height: 35,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Phone Number'),
                            checkEditInf == false
                                ? Text('${accountController.phonenumber}')
                                : Container(
                                    width: 300,
                                    child: TextField(
                                      textAlign: TextAlign.right,
                                      controller: _phonenumberController
                                        ..text =
                                            accountController.phonenumber.value,
                                      decoration: InputDecoration(
                                        border: UnderlineInputBorder(),
                                        hintText: 'Enter phone number',
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.white,
                        thickness: 0.5,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                        child: Text('Bảo mật'),
                      ),
                      Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      Container(
                        height: 35,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Email'),
                            Text('${accountController.email}')
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      Container(
                        height: 35,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Password'),
                            Row(
                              children: [
                                Text('***********'),
                                TextButton(onPressed: () {}, child: Text("Edit"))
                              ],
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.white,
                        thickness: 1,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}

enum GenderLabel {
  male('Male', Icons.male),
  female('Female', Icons.female),
  other('Other', Icons.transgender);

  const GenderLabel(this.label, this.icon);
  final String label;
  final IconData icon;
}
