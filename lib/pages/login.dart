
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:travel/core/utils/app_account_controller.dart';
import 'package:travel/pages/dashboard/dashboard_page.dart';
//import 'package:travel/lib/core/utils/app_account_controller.dart';
import 'package:travel/pages/register_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AccountController accountController = Get.put(AccountController());
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  bool _obscureText = true;
  final checkreg = TextEditingController();

  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
      accountController.ChangeLogin();
      await accountController.getAccount(_emailController.text);
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => DashboardPage()));
      print("Đăng nhập thành công");
      // Điều hướng đến trang khác, ví dụ: trang chủ
    } on FirebaseAuthException catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Center(
              child: Text(
            "Login failed",
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          )),
          content: Text("Email or Password is invalid. Please try again."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Đóng dialog
              },
              child: Text("Ok"),
            ),
          ],
        ),
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() => setState(() {}));
    _passwordController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => accountController.checkreg.value == false
        ? Scaffold(
            resizeToAvoidBottomInset: false,
            body: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Center(
                child: Column(
                  children: [
                    Expanded(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 100),
                            Text(
                              "Travel",
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 50),
                            TextField(
                              focusNode: _emailFocusNode,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                hintText: 'Email',
                                labelText: 'Email',
                                labelStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                                floatingLabelStyle:
                                    TextStyle(color: Colors.blue),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18),
                                  borderSide: BorderSide(
                                    color: Colors.blue,
                                  ),
                                ),
                                focusColor: Colors.blue,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18),
                                  borderSide: BorderSide(
                                    width: 2,
                                    color: Colors.blue,
                                  ),
                                ),
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: _emailFocusNode.hasFocus
                                      ? Colors.red
                                      : Colors.grey,
                                ),
                                suffixIcon: _emailController.text.isEmpty
                                    ? Container(width: 0)
                                    : IconButton(
                                        onPressed: () {
                                          _emailController.clear();
                                        },
                                        icon: Icon(
                                          Icons.close,
                                          color: Colors.red,
                                        ),
                                      ),
                              ),
                              controller: _emailController,
                            ),
                            SizedBox(height: 20),
                            TextField(
                              focusNode: _passwordFocusNode,
                              textInputAction: TextInputAction.done,
                              decoration: InputDecoration(
                                hintText: 'Password',
                                labelText: 'Password',
                                labelStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                                floatingLabelStyle:
                                    TextStyle(color: Colors.blue),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18),
                                  borderSide: BorderSide(
                                    color: Colors.blue,
                                  ),
                                ),
                                focusColor: Colors.blue,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18),
                                  borderSide: BorderSide(
                                    width: 2,
                                    color: Colors.blue,
                                  ),
                                ),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: _passwordFocusNode.hasFocus
                                      ? Colors.red
                                      : Colors.grey,
                                ),
                                suffixIcon: _passwordController.text.isEmpty
                                    ? Container(
                                        width: 0,
                                      )
                                    : IconButton(
                                        icon: Icon(
                                          _obscureText
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: _passwordFocusNode.hasFocus
                                              ? Colors.red
                                              : Colors.grey,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _obscureText = !_obscureText;
                                          });
                                        },
                                      ),
                              ),
                              obscureText: _obscureText,
                              controller: _passwordController,
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(width: 0),
                                TextButton(
                                  onPressed: () {},
                                  child: Text("Quên mật khẩu"),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          height: 60,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: Colors.yellow,
                          ),
                          child: InkWell(
                            onTap: signIn,
                            child: Center(
                              child: Text(
                                "Đăng nhập",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 20),
                        Container(
                          height: 60,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(width: 1, color: Colors.grey),
                          ),
                          child: InkWell(
                            onTap: () {
                              accountController.changeReg();
                            },
                            child: Center(
                              child: Text(
                                "Tạo tài khoản",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                      

                        Container(
                          padding: EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: Icon(Icons.camera_alt),
                                onPressed: () {
                                  // Đăng nhập Instagram
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.email),
                                onPressed: () {
                                  // Đăng nhập Google
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.facebook),
                                onPressed: () {
                                  // Đăng nhập Facebook
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        : RegisterPage());
  }
}
