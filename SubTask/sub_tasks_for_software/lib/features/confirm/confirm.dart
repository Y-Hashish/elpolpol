import 'package:flutter/material.dart';
import 'package:frist_pages/features/home/home_page.dart';

class confirmCheckout extends StatelessWidget {
  String fname = '';
  String lname = '';
  String location = '';
  String phoneNumber = '';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a valid name';
                  }
                  return null;
                },
                onSaved: (value) {
                  fname = value!;
                },
                decoration: const InputDecoration(
                  hintText: 'First Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a valid name';
                  }
                  return null;
                },
                onSaved: (value) {
                  lname = value!;
                },
                decoration: InputDecoration(
                  hintText: 'Last Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                validator: (value) {
                  // RegExp regex = RegExp(r'^\d+$');
                  // if (!regex.hasMatch(value!) || value.length != 10) {
                  //   return 'Please enter a valid phone number';
                  // }
                  return null;
                },
                onSaved: (value) {
                  phoneNumber = value!;
                },
                decoration: InputDecoration(
                  hintText: 'Phone Number',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                validator: (value) {
                  if (value!.length < 3) {
                    return 'Please enter a valid address';
                  }
                  return null;
                },
                onSaved: (value) {
                  location = value!;
                },
                decoration: InputDecoration(
                  hintText: 'Address',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        print('First Name: $fname');
                        print('Last Name: $lname');
                        print('Phone Number: $phoneNumber');
                        print('Address: $location');
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text('Your order confimed successfully'),
                              backgroundColor: Colors.green),
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      }
                    },
                    child: Text('Confirm'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _formKey.currentState!.reset();
                    },
                    child: Text('Reset'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
