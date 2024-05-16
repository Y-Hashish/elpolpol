
// ignore_for_file: non_constant_identifier_names

class User {
  int? id;
  String  name;
  String  password;
  String  email;
  String  phone;
  String address;

  User(this.id,this.name, this.password, this.email, this.phone, this.address);
  Map<String, dynamic> toMap() {
    return {
      'first_name': name,
      'email': email,
      'password': password,
      'phone': phone,
      'address': address,
    };
  }
}



