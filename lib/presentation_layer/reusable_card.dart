import 'package:flutter/material.dart';


class ReusableCard extends StatelessWidget {

  ReusableCard({required this.color,required this.cardChild});

  final Color color;
  final Widget cardChild;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      height: 30.0,
      margin: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
          color:Colors.amber,
          borderRadius: BorderRadius.circular(8.0)),);
  }
}