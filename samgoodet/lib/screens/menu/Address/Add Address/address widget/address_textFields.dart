import 'package:flutter/material.dart';

class AddressTextFields extends StatelessWidget {
   AddressTextFields({ Key? key, required this.controller, required this.keyboardType,required this.validator, required this.hint }) : super(key: key);
TextEditingController controller;
String? Function(String?) validator;
String hint;
TextInputType keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint
      ),
    );
  }
}