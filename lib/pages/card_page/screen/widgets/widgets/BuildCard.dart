import 'package:flutter/material.dart';


class CreditCardFunction extends StatefulWidget {
  final Color color;
  final String cardId;
  final String lastNumbersOfCard;
  final String name;
  final int? amount;
  final int? month;
  final int? year;
  const CreditCardFunction(
      {super.key,
      required this.color,
      required this.lastNumbersOfCard,
      required this.name,
      required this.amount,
      required this.month,
      required this.year,
      required this.cardId});

  @override
  State<CreditCardFunction> createState() => _CreditCardFunctionState();
}

class _CreditCardFunctionState extends State<CreditCardFunction> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      color: widget.color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: Container(
        height: 200,
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(widget.cardId),
                Image.asset(
                  "assets/images/mastercard.png",
                  height: 50,
                  width: 50,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                widget.lastNumbersOfCard,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontFamily: 'CourrierPrime'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'CARDHOLDER',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 9,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.name,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'Money',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 9,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.amount.toString(), //
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'VALID THRU',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 9,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${widget.month.toString()}/${widget.year}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
