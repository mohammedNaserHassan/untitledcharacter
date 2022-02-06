import 'package:flutter/material.dart';

import '../../constants.dart';
class showLoadingIndicator extends StatelessWidget {
  const showLoadingIndicator();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: white,
      ),
    );
  }
}
