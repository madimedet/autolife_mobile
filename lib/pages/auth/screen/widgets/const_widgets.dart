import 'package:flutter/material.dart';

import '../../../../constants/colors/colors.dart';


const TextStyle style = TextStyle(
  fontSize: 48,
  color: Color.fromARGB(255, 96, 99, 255),
);
final ButtonStyle style3 = ElevatedButton.styleFrom(
    textStyle: const TextStyle(fontSize: 20),
    backgroundColor: ColorStyles.colors2,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)));
const TextStyle style4 = TextStyle(
  fontSize: 20,
  color: Color.fromARGB(255, 255, 255, 255),
);

class Textfield1 extends StatelessWidget {
 final String? Function(String?)? validator;
  final bool obscureText;
  final String labelText;
  final Color color;
  final TextEditingController controller;
  final int? max;
  final dynamic keyboard;
  const Textfield1(
      {super.key,
      required this.labelText,
      required this.color,
      required this.controller,
      this.obscureText = false,
      this.max,
      required this.keyboard, this.validator});

  @override
  Widget build(BuildContext context) {
     
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 25),
      child: Form(
        
        child: TextFormField( 
         validator: validator,
          controller: controller,
          obscureText: obscureText,
          maxLength: max,
          keyboardType: keyboard,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 1, color: ColorStyles.colors2),
                borderRadius: BorderRadius.circular(16)),
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: ColorStyles.colors2, width: 6)),
            labelText: labelText,
            labelStyle: const TextStyle(color: Colors.black38, fontSize: 10),
          ),
        ),
      ),
    );
  }
}
