import 'package:flutter/material.dart';


import '../../../../../constants/colors/colors.dart';

class TitleCardSection extends StatelessWidget {
  final String title;
  final String subTitle;
  const TitleCardSection(
      {super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 16.0),
          child: Text(
            title,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 16.0),
          child: Text(
            subTitle,
            style: const TextStyle(fontSize: 21, color: ColorStyles.colors2),
          ),
        )
      ],
    );
  }
}
