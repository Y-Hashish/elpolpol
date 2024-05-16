import 'package:flutter/material.dart';
import 'package:frist_pages/core/utils/extension.dart';
import 'package:frist_pages/features/login/view/components/button_login.dart';
import 'package:frist_pages/features/login/view/components/login_data_widget.dart';


class LoginPage extends StatelessWidget {
  const LoginPage( {super.key, required this.firstName, required this.lastName});

  final String firstName, lastName;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
  backgroundColor: context.backgroundColor,
  appBar: AppBar(
    toolbarHeight: 50,
    backgroundColor: const Color.fromARGB(255, 28, 41, 126),
    title: Text("$firstName  $lastName"),
    ),
  

        body: Stack(
          
          children: [
            // Container(
            //   decoration: BoxDecoration(
                
            //     color: const Color.fromARGB(255, 54, 55, 55),
            //     image: DecorationImage(
            //       image: const AssetImage(
            //           'Images/background.jpg'), // Adjust path to your image
            //       fit: BoxFit.cover,
            //       colorFilter: ColorFilter.mode(
            //           Colors.black.withOpacity(0.6), BlendMode.dstATop),
            //     ),
            //   ),
            // ),
           Column(
              children: [
            
                  Image.asset(
                  "assets/images/logo.jpg",
                  height: 200,
                  ),
                const Expanded(
                  child: LoginDataWidget(),
                ),
              const SizedBox(
                  height: 200,
                  child: ButtonLogin(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
