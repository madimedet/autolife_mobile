import 'package:autolife_application_3/pages/main_page/view/widget/buttn_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../routes/app_routes.dart';
import '../../auth/screen/widgets/const_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                      Text("Autolife ", style: GoogleFonts.poppins(fontSize: 40)),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.CARDS);
                  },
                  child: Container(
                    width: 300.0,
                    height: 100.0,
                    padding: const EdgeInsets.all(35),
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [Colors.greenAccent, Colors.green])),
                    alignment: Alignment.bottomRight,
                    child: Text(
              "Карты",
              style: GoogleFonts.poppins(
                  fontSize: 20, color: Colors.white),
            )
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.ALLTRANSACTION);
                  },
                  child: Container(
                    width: 300.0,
                    height: 100.0,
                    padding: const EdgeInsets.all(35),
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [Colors.yellowAccent, Color.fromARGB(255, 125, 129, 13)])),
                    alignment: Alignment.bottomRight,
                    child: Text(
              "Транзакции",
              style: GoogleFonts.poppins(
                  fontSize: 20, color: Colors.white),
            ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.TRANSACTION);
                  },
                  child: Container(
                    width: 300.0,
                    height: 100.0,
                    padding: const EdgeInsets.all(35),
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [Colors.blueAccent, Color.fromARGB(255, 20, 59, 151)])),
                    alignment: Alignment.bottomRight,
                    child: Text(
              "Транзакции по дате",
              style: GoogleFonts.poppins(
                  fontSize: 20, color: Colors.white),
            )
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.ALLACCOMM);
                  },
                  child: Container(
                    width: 300.0,
                    height: 100.0,
                    padding: const EdgeInsets.all(35),
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [Colors.redAccent, Color.fromARGB(255, 125, 31, 25)])),
                    alignment: Alignment.bottomRight,
                    child: Text(
              "Список услуг",
              style: GoogleFonts.poppins(
                  fontSize: 20, color: Colors.white),
            )
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
