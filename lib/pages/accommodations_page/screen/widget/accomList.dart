import 'package:flutter/material.dart';

class AccomListWidget extends StatelessWidget {
  final String? id;
  final String? name;

  const AccomListWidget(
      {super.key,
      this.id,
      this.name,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
                  height: 70.0,
                  padding: EdgeInsets.all(10),
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [Colors.greenAccent, Color.fromARGB(255, 45, 177, 54)])),
                  alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:  <Widget>[
          Text("id: ${id ?? " "}" , style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black),),
         Text("Название услуги: ${name ?? " "}", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),)
          ],
          
      ),
    );
  }
}