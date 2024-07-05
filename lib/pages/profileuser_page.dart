import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travel/core/utils/app_account_controller.dart';
//import 'package:travel/lib/core/utils/app_account_controller.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:velocity_x/velocity_x.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:travel/core/values/image.dart';
import 'package:travel/pages/detail_profile_page.dart';
import 'package:uuid/uuid.dart';

class ProfileUser extends StatefulWidget {
  ProfileUser({super.key});

  @override
  State<ProfileUser> createState() => _ProfileUserState();
}

class _ProfileUserState extends State<ProfileUser> {
  final AccountController accountController = Get.find<AccountController>();
  Uint8List? _image;
  late firebase_storage.Reference ref;
  XFile? _selectedFile;
  String image = '';
  bool checkChangeImage = false;
  Future<void> SelectImage() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
    if (file == null) {
      print('No image selected.');
      return;
    }

    print('Selected file path: ${file.path}');
    if (file != null) {
      final imageBytes = await file.readAsBytes();
      setState(() {
        _image = imageBytes;
        _selectedFile = file;
      });
    }
  }

  Future<void> AddImage() async {
    String uniqueFileName = DateTime.now().microsecondsSinceEpoch.toString();
    ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child('imageUser')
        .child(uniqueFileName);

    try {
      await ref.putFile(File(_selectedFile!.path));
      image = await ref.getDownloadURL();
      await accountController.updateImageUser(
          accountController.id.value, image);
      await accountController.getAccount(accountController.email.value);
      print('File uploaded successfully');
    } catch (e) {
      print('Error uploading file: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Profile",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        body: Obx(
          () => SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Center(
                child: Column(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      child: Stack(
                        children: [
                          (accountController.imageUser.value == '' &&
                                  _image == null)
                              ? Container(
                                  height: 200,
                                  width: double.infinity,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: CircleAvatar(
                                      radius: 50,
                                      backgroundImage:
                                          AssetImage(AppAssets.imageUser),
                                    ),
                                  ),
                                )
                              : _image != null
                                  ? Container(
                                      child: CircleAvatar(
                                          radius: 50,
                                          backgroundImage:
                                              MemoryImage(_image!)),
                                    )
                                  : Container(
                                      child: CircleAvatar(
                                          radius: 50,
                                          backgroundImage: NetworkImage(
                                              accountController
                                                  .imageUser.value)),
                                    ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width:
                                  30, // Đặt kích thước với đường kính mong muốn
                              height: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white, // Màu nền là màu trắng
                              ),
                              child: InkWell(
                                onTap: () async {
                                  await SelectImage();
                                  if (_selectedFile != null) {
                                    setState(() {
                                      checkChangeImage = true;
                                    });
                                  }
                                },
                                child: Icon(Icons.add_a_photo),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Text(
                        "${accountController.username}",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                    checkChangeImage == true
                        ? Container(
                            child: Column(
                              children: [
                                TextButton(
                                    onPressed: () async {
                                      await AddImage();
                                      setState(() {
                                        checkChangeImage = false;
                                      });
                                    },
                                    child: Text("Save"))
                              ],
                            ),
                          )
                        : Container(),
                    SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(DetailprofilePage());
                        print('object');
                      },
                      child: Container(
                        height: 70,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(width: 2, color: Colors.grey),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Persional Information',
                                style: TextStyle(fontSize: 18),
                              ),
                              Icon(Icons.account_circle_outlined)
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        print('object');
                      },
                      child: Container(
                        height: 70,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(width: 2, color: Colors.grey),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'FAQ',
                                style: TextStyle(fontSize: 18),
                              ),
                              Icon(Icons.chat_outlined)
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        print('object');
                      },
                      child: Container(
                        height: 70,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(width: 2, color: Colors.grey),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Dark Mode',
                                style: TextStyle(fontSize: 18),
                              ),
                              Icon(Icons.switch_camera_outlined)
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        print('object');
                      },
                      child: Container(
                        height: 70,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(width: 2, color: Colors.grey),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Language',
                                style: TextStyle(fontSize: 18),
                              ),
                              Icon(Icons.language)
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () async {
                        Get.bottomSheet(
                          Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            height: 200,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Center(
                                  child: Text(
                                    'LOGOUT',
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Text('Are you sure you want to logout?'),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: Container(
                                        height: 50,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            color: Colors.yellow,
                                            borderRadius:
                                                BorderRadius.circular(18)),
                                        child: Center(child: Text("Cancel")),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        Get.back();
                                        await FirebaseAuth.instance.signOut();
                                        accountController.checklogin.value =
                                            false;
                                        print(
                                            "${accountController.checklogin.value}");
                                      },
                                      child: Container(
                                        height: 50,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(18)),
                                        child: Center(child: Text("Logout")),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: 70,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(width: 2, color: Colors.grey),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Logout',
                                style: TextStyle(fontSize: 18),
                              ),
                              Icon(Icons.logout_outlined)
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
