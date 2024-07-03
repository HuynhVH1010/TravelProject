import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel/pages/Screen/Setting.dart';
import 'package:travel/pages/dashboard/dashboard_controller.dart';
import 'package:travel/pages/dashboard/dashboard_page.dart';
import 'package:travel/pages/favorite_page.dart';
import 'package:travel/profile/Profile.dart';

class Information extends StatefulWidget {
  const Information({super.key});

  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text(
          'Thông tin chi tiết',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(height: 30),
            Container(
              width: 450,
              padding: EdgeInsets.only(top: 10, left: 30, right: 30),
              child: TextFormField(
                decoration: InputDecoration(
                  suffixIcon: Icon(CupertinoIcons.person_circle_fill,
                  color: Colors.yellow,
                  ),
                  label: Text(
                    'Họ và tên',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                    ),
                  ),
                    contentPadding: EdgeInsets.all(15),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                            width: 2,
                            style: BorderStyle.solid,
                            color: Colors.black
                        )
                    )
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              width: 450,
              padding: EdgeInsets.only(top: 10, left: 30, right: 30),
              child: TextFormField(
                decoration: InputDecoration(
                    suffixIcon: Icon(CupertinoIcons.mail_solid,
                    color: Colors.yellow,),
                    label: Text(
                      'Email',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                      ),
                    ),
                    contentPadding: EdgeInsets.all(15),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                            width: 2,
                            style: BorderStyle.solid,
                            color: Colors.black
                        )
                    )
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              width: 450,
              padding: EdgeInsets.only(top: 10, left: 30, right: 30),
              child: TextFormField(
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.phone,color: Colors.yellow,),
                    label: Text(
                      'Điện thoại',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                      ),
                    ),
                    contentPadding: EdgeInsets.all(15),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                            width: 2,
                            style: BorderStyle.solid,
                            color: Colors.black
                        )
                    )
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              width: 450,
              padding: EdgeInsets.only(top: 10, left: 30, right: 30),
              child: TextFormField(
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.male,
                    color: Colors.yellow,),
                    label: Text(
                      'Giới tính',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                      ),
                    ),
                    contentPadding: EdgeInsets.all(15),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                            width: 2,
                            style: BorderStyle.solid,
                            color: Colors.black
                        )
                    )
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              width: 450,
              padding: EdgeInsets.only(top: 10, left: 30, right: 30),
              child: TextFormField(
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.date_range,
                    color: Colors.yellow,),
                    label: Text(
                      'Ngày sinh',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                      ),
                    ),
                    contentPadding: EdgeInsets.all(15),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                            width: 2,
                            style: BorderStyle.solid,
                            color: Colors.black
                        )
                    )
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              width: 450,
              padding: EdgeInsets.only(top: 10, left: 30, right: 30),
              child: ListTile(

                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder:  (context) => AlertDialog(
                      title: Text('Đổi mật khẩu'),
                      actions: [
                        Container(
                          child: TextFormField(
                            decoration: InputDecoration(
                                suffixIcon: Icon(CupertinoIcons.eye_fill),
                                label: Text(
                                  'Mật khẩu cũ',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                contentPadding: EdgeInsets.all(15),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                        width: 2,
                                        style: BorderStyle.solid,
                                        color: Colors.black
                                    )
                                )
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Vui lòng nhập mật khẩu";
                              }
                            },
                          ),
                          // child: TextFormField(
                          //   onPressed: (){
                          //     // Get.to(MyLogin());
                          //   },
                          //   child: TextFormField(
                          //     'Xác nhận',
                          //     style: TextStyle(
                          //       fontWeight: FontWeight.bold,
                          //       color: Colors.black,
                          //     ),
                          //   ),
                          //   style: ElevatedButton.styleFrom(
                          //       backgroundColor: Colors.yellow
                          //   ),
                          // ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          child: TextFormField(
                            decoration: InputDecoration(
                                suffixIcon: Icon(CupertinoIcons.eye_fill),
                                label: Text(
                                  'Mật khẩu mới',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                contentPadding: EdgeInsets.all(15),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                        width: 2,
                                        style: BorderStyle.solid,
                                        color: Colors.black
                                    )
                                )
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Vui lòng nhập mật khẩu";
                              }
                            },
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          child: TextFormField(
                          decoration: InputDecoration(
                              suffixIcon: Icon(CupertinoIcons.eye_fill),
                              label: Text(
                                'Nhập lại mật khẩu mới',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              contentPadding: EdgeInsets.all(15),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                      width: 2,
                                      style: BorderStyle.solid,
                                      color: Colors.black
                                  )
                              )
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Vui lòng nhập lại mật khẩu mới";
                            }
                          },
                        ),
                        ),
                        Row(
                          children: [
                            Container(
                              child: ElevatedButton(
                                onPressed: (){
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: Text('Đổi mật khẩu thành công :))'),
                                        actions: [
                                          Container(
                                            child: ElevatedButton(
                                                onPressed: (){
                                                  Get.to(Information());
                                                },
                                                child: Text(
                                                    'OK',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold
                                                  ),
                                                ),
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.yellow
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                  );
                                },
                                child: Text(
                                  'Xác nhận',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.yellow
                                ),
                              ),
                            ),
                            Container(
                              child: ElevatedButton(
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'Hủy',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.yellow
                                ),
                              ),
                            )
                          ],
                        )


                      ],
                    ),
                  );
                },
                title: const Text('Đổi mật khẩu',
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),
                ),
                // subtitle: const Text('Chưa có thông báo',
                //   style: TextStyle(
                //       color: Colors.black),
                // ),
                // leading: Icon(Icons.logout, color: Colors.black),
                trailing: Icon(Icons.arrow_forward, color: Colors.black),
                tileColor: Colors.yellow,

              ),
            )

          ],
        ),
      ),
    );
  }
}
