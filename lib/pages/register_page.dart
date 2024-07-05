
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel/core/utils/app_account_controller.dart';
//import 'package:travel/lib/core/utils/app_account_controller.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final AccountController accountController = Get.put(AccountController());
  final _emailController = TextEditingController();
  final _fullnameController = TextEditingController();

  final _passwordController = TextEditingController();
  final _enterPasswordController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _fullnameFocusNode = FocusNode();

  final _passwordFocusNode = FocusNode();
  final _enterPasswordFocusNode = FocusNode();
  final _phoneNumberFocusNode = FocusNode();

  bool _obscurePassword = true;
  bool _obscureEnterPassword = true;
  String? _selectedGender;
  List<String> _genders = ['Male', 'Female', 'Other'];

  Future<void> signUp() async {
    String fullname = _fullnameController.text;
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    String enterPassword = _enterPasswordController.text.trim();
    String phonenumber = _phoneNumberController.text.trim();
    String gender = _selectedGender.toString();
    final _auth = FirebaseAuth.instance;
    if (password.isEmpty ||
        email.isEmpty ||
        enterPassword.isEmpty ||
        phonenumber.isEmpty ||
        gender.isEmpty) {
      return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Center(
              child: Text(
            "Error",
            style: TextStyle(color: Colors.red),
          )),
          content: Text("Vui lòng nhập đầy đủ thông tin!"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        ),
      );
    }
    // Kiểm tra mật khẩu có đủ 8 ký tự không
    if (password.length < 8) {
      return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Error"),
          content: Text("Mật khẩu phải chứa ít nhất 8 ký tự!"),
          actions: [
            TextButton(
              onPressed: () {
                _passwordController.clear();
                _enterPasswordController.clear();
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        ),
      );
    }
    // Kiểm tra mật khẩu có trùng khớp không
    if (password != enterPassword) {
      return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Error"),
          content: Text("Mật khẩu nhập lại không khớp!"),
          actions: [
            TextButton(
              onPressed: () {
                _passwordController.clear();
                _enterPasswordController.clear();
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        ),
      );
    }
    try {
      // Tạo người dùng với email và mật khẩu
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Đăng ký thành công
      print("Đăng ký thành công: ${userCredential.user?.email}");
      accountController.changeReg();
      await accountController.CreateUser(
          fullname, email, password, phonenumber, gender, '');

      await accountController.getAccount(email);

      // showDialog(
      //   context: context,
      //   builder: (context) => AlertDialog(
      //     title: Text("Success"),
      //     content: Text("Đăng ký thành công!"),
      //     actions: [
      //       TextButton(
      //         onPressed: () {
      //           Navigator.of(context).pop();
      //           accountController.changeReg();
      //         },
      //         child: Text("OK"),
      //       ),
      //     ],
      //   ),
      // );
    } on FirebaseAuthException catch (e) {
      // Xử lý các lỗi có thể xảy ra trong quá trình đăng ký
      String message;
      if (e.code == 'email-already-in-use') {
        message = 'Email này đã được sử dụng!';
      } else if (e.code == 'invalid-email') {
        message = 'Email không hợp lệ!';
      } else if (e.code == 'weak-password') {
        message = 'Mật khẩu quá yếu!';
      } else {
        message = 'Đã xảy ra lỗi: ${e.message}';
      }
      print(message);
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Error"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        ),
      );
    } catch (e) {
      // Xử lý các lỗi khác
      print('Đã xảy ra lỗi: $e');
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Error"),
          content: Text('Đã xảy ra lỗi: $e'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _fullnameController.dispose();

    _passwordController.dispose();
    _enterPasswordController.dispose();
    _phoneNumberController.dispose();
    _emailFocusNode.dispose();
    _fullnameFocusNode.dispose();

    _passwordFocusNode.dispose();
    _enterPasswordFocusNode.dispose();
    _phoneNumberFocusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _fullnameController.addListener(() => setState(() {}));

    _emailController.addListener(() => setState(() {}));
    _passwordController.addListener(() => setState(() {}));
    _enterPasswordController.addListener(() => setState(() {}));
    _phoneNumberController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        child: Text(
                          "Create account",
                          style: TextStyle(
                              fontSize: 50, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        focusNode: _fullnameFocusNode,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'Pham Minh Thai',
                          labelText: 'Full name',
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          floatingLabelStyle: TextStyle(color: Colors.blue),
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
                            Icons.account_circle,
                            color: _fullnameFocusNode.hasFocus
                                ? Colors.red
                                : Colors.grey,
                          ),
                          suffixIcon: _fullnameController.text.isEmpty
                              ? Container(width: 0)
                              : IconButton(
                                  onPressed: () {
                                    _fullnameController.clear();
                                  },
                                  icon: Icon(
                                    Icons.close,
                                    color: Colors.red,
                                  ),
                                ),
                        ),
                        controller: _fullnameController,
                      ),
                      SizedBox(height: 20),
                      TextField(
                        focusNode: _emailFocusNode,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'minhthai@example.com',
                          labelText: 'Email',
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          floatingLabelStyle: TextStyle(color: Colors.blue),
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
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: 'Minhthai123',
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          floatingLabelStyle: TextStyle(color: Colors.blue),
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
                                    _obscurePassword
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: _passwordFocusNode.hasFocus
                                        ? Colors.red
                                        : Colors.grey,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _obscurePassword = !_obscurePassword;
                                    });
                                  },
                                ),
                        ),
                        obscureText: _obscurePassword,
                        controller: _passwordController,
                      ),
                      SizedBox(height: 20),
                      TextField(
                        focusNode: _enterPasswordFocusNode,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: 'Minhthai123',
                          labelText: 'Enter the password',
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          floatingLabelStyle: TextStyle(color: Colors.blue),
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
                            color: _enterPasswordFocusNode.hasFocus
                                ? Colors.red
                                : Colors.grey,
                          ),
                          suffixIcon: _enterPasswordController.text.isEmpty
                              ? Container(
                                  width: 0,
                                )
                              : IconButton(
                                  icon: Icon(
                                    _obscureEnterPassword
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: _enterPasswordFocusNode.hasFocus
                                        ? Colors.red
                                        : Colors.grey,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _obscureEnterPassword =
                                          !_obscureEnterPassword;
                                    });
                                  },
                                ),
                        ),
                        obscureText: _obscureEnterPassword,
                        controller: _enterPasswordController,
                      ),
                      SizedBox(height: 20),
                      TextField(
                        focusNode: _phoneNumberFocusNode,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: '097223463',
                          labelText: 'Phone Number',
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          floatingLabelStyle: TextStyle(color: Colors.blue),
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
                            Icons.phone,
                            color: _phoneNumberFocusNode.hasFocus
                                ? Colors.red
                                : Colors.grey,
                          ),
                          suffixIcon: _phoneNumberController.text.isEmpty
                              ? Container(width: 0)
                              : IconButton(
                                  onPressed: () {
                                    _phoneNumberController.clear();
                                  },
                                  icon: Icon(
                                    Icons.close,
                                    color: Colors.red,
                                  ),
                                ),
                        ),
                        controller: _phoneNumberController,
                      ),
                      SizedBox(height: 20),
                      DropdownButtonFormField(
                        value: _selectedGender,
                        items: _genders.map((String gender) {
                          return DropdownMenuItem(
                            value: gender,
                            child: Text(gender),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            _selectedGender = value;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: 'Gender',
                          labelText: 'Gender',
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          floatingLabelStyle: TextStyle(color: Colors.blue),
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
                            Icons.transgender,
                            color: _phoneNumberFocusNode.hasFocus
                                ? Colors.red
                                : Colors.grey,
                          ),
                        ),
                      ),
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
                      onTap: () async {
                        signUp();
                        // showDialog(
                        //   context: context,
                        //   builder: (context) => AlertDialog(
                        //     title: Text("Success"),
                        //     content: Text("Đăng ký thành công!"),
                        //     actions: [
                        //       TextButton(
                        //         onPressed: () {
                        //           Navigator.of(context).pop();
                        //           accountController.changeReg();
                        //         },
                        //         child: Text("OK"),
                        //       ),
                        //     ],
                        //   ),
                        // );
                      },
                      child: Center(
                        child: Text(
                          "Đăng ký",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'I\'m a member',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {
                          accountController.changeReg();
                        },
                        child: Text(
                          ' Login now',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
