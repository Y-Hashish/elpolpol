import 'package:flutter/material.dart';
import 'package:frist_pages/core/utils/extension.dart';
import 'package:frist_pages/features/home/home_page.dart';
import 'package:frist_pages/features/registration/view/page/regisration_page.dart';
// import 'package:frist_pages/features/auth/forgotPassword/view/page/forgotPassword_page.dart';


class ButtonLogin extends StatelessWidget {
  const ButtonLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: context.width - 200,
                  height: 45,
        child :FilledButton(
          style :  ButtonStyle(
            backgroundColor:
            MaterialStatePropertyAll(context.forgroundColor),
            shape:
            MaterialStateProperty.all<RoundedRectangleBorder>(
           RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(10.0),
                            
            ),
        )),
                        
          
              onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },


     child: const Text('Confirm')) ,
    ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [const Text("Don't have account ? ",style: TextStyle(color: Color(0xff14238A)),) ,
            TextButton(onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (v) {
                      return const RegistrationPage ();
                    }
                    )
                    );

            },
            style: const ButtonStyle(
              padding: MaterialStatePropertyAll(EdgeInsets.all(3))
            ), child: const Text("Sign up" ,
            style: TextStyle(
              color: Color.fromARGB(255, 54, 73, 200) ,
              decorationStyle: TextDecorationStyle.solid ,
              decoration: TextDecoration.underline ,
              decorationThickness: 3 ,
            ),) ,)
          ],
        )
      ],
    );
  }
}