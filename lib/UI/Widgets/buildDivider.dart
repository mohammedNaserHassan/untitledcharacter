import 'package:flutter/material.dart';

import '../../constants.dart';
class buildDivider extends StatelessWidget {
  double endIndent;
   buildDivider(this.endIndent);

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 30,
      endIndent: endIndent,
      color: blue,
      thickness: 2,
    );
  }
}
