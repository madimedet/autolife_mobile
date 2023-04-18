import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TransactionWidget extends StatelessWidget {
  final String? id;
  final String? createdAt;
  final String? serviceId;
  final String? referenceId;
  final String? serviceDescription;
  final int? serviceAmount;
  final String? currency;
  final String? userId;
  const TransactionWidget(
      {super.key,
      this.id,
      this.createdAt,
      this.serviceId,
      this.referenceId,
      this.serviceDescription,
      this.serviceAmount,
      this.currency,
      this.userId});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: const LinearGradient(
              colors: [Colors.black26, Colors.black54],
              end: Alignment.topLeft,
              begin: Alignment.bottomRight),
          boxShadow: const [
            BoxShadow(
                color: Colors.black12, blurRadius: 12, offset: Offset(0, 6)),
          ]),
      child: Column(
        children:  <Widget>[
          Text(id ?? " "),
          Text(createdAt ?? " "),
          Text(serviceId ?? " "),
          Text(referenceId ?? " "),
          Text(serviceDescription ?? " "),
          Text("$serviceAmount" ),
          Text(currency ?? " "),
          Text(userId ?? " "),
          ],
          
      ),
    );
  }
}
