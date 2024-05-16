import 'package:flutter/material.dart';
import 'package:frist_pages/core/utils/extension.dart';
import 'package:frist_pages/core/utils/validation.dart';

class ForgotPasswordWidget extends StatelessWidget {
  const ForgotPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

             children: [
              const Text('Reset your Password',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff14238A),
                )),
            ///Mail
            TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: TextEditingController(),
                keyboardType: TextInputType.emailAddress,
                validator: MyValidation().emailValidate ,
                decoration: const InputDecoration(
                  labelText: "Email Adrress",
                    prefixIcon: Icon(
                        Icons.mail,
                        color: Color(0xff14238A),
                        ),
                      fillColor: Color(0xffE6F5FA),
                      filled: true,
                     border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1),

                        
                           ),
          focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 1)

          
          ),
         errorBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 2)

            
              )
              )
              ),

                 SizedBox(height: context.height/5),
        ]
      ),
    );
  }
}
