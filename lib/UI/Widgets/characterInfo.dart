import 'package:flutter/material.dart';

import '../../constants.dart';
class characterInfo extends StatelessWidget {
  String title,value;
   characterInfo({this.title,this.value});

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: TextStyle(
              color: white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: value,
            style: TextStyle(
              color: white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
