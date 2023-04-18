import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonHome extends StatelessWidget {
  final String text;
  
  final Color color1;
  final Color color2;
  final Function? function;
  const ButtonHome(
      {super.key,
      required this.text,
     
      required this.color1,
      this.function,
      required this.color2});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      height: 100.0,
      padding: const EdgeInsets.all(35),
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [color1, color2])),
      alignment: Alignment.bottomRight,
      child: ElevatedButton(
          onPressed: function!(),
          child: Text(
            text,
            style: GoogleFonts.poppins(
                fontSize: 10, color: Colors.white),
          )),
    );
  }
}
