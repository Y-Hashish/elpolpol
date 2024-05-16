

class MyValidation {
  String? nameValidate(String? input) {
    //correct pattern
    if (((input?.length??0) > 4 ) ) {
      return null;
    }

    ///incorrect
    return "invalid name";
  }

    String? emailValidate(String? input) {
    if (input!.isEmpty ||
        !RegExp(r'^[a-zA-Z0-9]+@gmail.com$').hasMatch(input))
         {
      return 'Enter correct email';
    } 

      return null;
  
  }

  String? passwordValidate(String? input) {
    if (input!.isEmpty ||
        !RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*]).{8,}$').hasMatch(input))
         {
      return 'Enter correct password';
    } 

      return null;
  
  }
}

