// import 'package:flutter/material.dart';
//
// Widget buildTextFieldLogin({
//   required TextEditingController controller,
//   required String hintText,
//   required Widget prefixIcon,
//   required Widget? suffixIcon,
//   bool obscureText = false,
// }) {
//   return Container(
//       height: 50,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(22),
//         boxShadow: [
//           BoxShadow(
//             offset: Offset(2, 4),
//             color: Colors.black12,
//             blurRadius: 2,
//           ),
//         ],
//       ),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 8),
//         child: TextField(
//             controller: controller,
//             obscureText: obscureText,
//             decoration: InputDecoration(
//               border: InputBorder.none,
//               hintText: hintText,
//               prefixIcon: prefixIcon,
//               suffixIcon: suffixIcon != null ? suffixIcon : null,
//             )),
//       ));
// }
