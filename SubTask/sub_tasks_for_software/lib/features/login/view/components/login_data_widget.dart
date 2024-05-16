import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:frist_pages/core/utils/extension.dart';
import 'package:frist_pages/core/utils/validation.dart';
import 'package:frist_pages/features/forgotPassword/view/page/forgot_password_page.dart';

class LoginDataWidget extends StatelessWidget {
  const LoginDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsetsDirectional.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const Text('Login',
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff14238A),
                )),

            const SizedBox(height: 25),

            ///for Email

            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: TextEditingController(),
              keyboardType: TextInputType.emailAddress,
              validator: MyValidation().emailValidate,
              decoration: const InputDecoration(
                  label: Text('Enter Email'),
                  //             style:
                  //             TextStyle( fontWeight: FontWeight.bold,
                  //                         color: Colors.black,)
                  // ),
                  floatingLabelAlignment: FloatingLabelAlignment.center,
                  //floatingLabelBehavior: FloatingLabelBehavior.never,
                  // suffixIcon: Icon(Icons.account_circle),
                  prefixIcon: Icon(
                        Icons.mail,
                        color: Color(0xff14238A),
                        ),
                  hintText: '******@gmail.com',
                  filled: true,
                  fillColor: Color(0xffE6F5FA),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 1),
                    // borderRadius: BorderRadius.circular(30)
                  ),
                  focusedBorder: OutlineInputBorder(),
                  errorBorder: OutlineInputBorder()),
            ),
            const SizedBox(height: 25),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: TextEditingController(),
              keyboardType: TextInputType.emailAddress,
              validator: MyValidation().passwordValidate,
              obscureText: true,
              decoration: const InputDecoration(
                  label: Text('Your Password'),
                  // style:
                  //     TextStyle(
                  //       fontWeight: FontWeight.bold,
                  //      color: Colors.black,)),
                  floatingLabelAlignment: FloatingLabelAlignment.center,
                  prefixIcon: Icon(
                        Icons.lock,
                        color: Color(0xff14238A),
                      ),
                      suffixIcon: Icon(
                        CupertinoIcons.eye_slash,
                        color: Color(0xff14238A),
                      ),
                  hintText: '**************',
                  filled: true,
                  fillColor: Color(0xffE6F5FA),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 1),
                    // borderRadius: BorderRadius.circular(30)
                  ),
                  focusedBorder: OutlineInputBorder(),
                  errorBorder: OutlineInputBorder()),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (v) {
                      return const  ForgotPasswordPage();
                    }
                    )
                    );
                    },
                    style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.all(3))),
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Color.fromARGB(255, 37, 54, 166),
                        decorationStyle: TextDecorationStyle.solid,
                        decoration: TextDecoration.underline,
                        decorationThickness: 3,
                      ),
                    ))
              ],
            )
          ],
        )
        );
  }
}

//         ],
//     )
//     );
//   }
// }