import 'package:flutter/material.dart';

import '../../constants.dart';
import 'buildCharactersList.dart';
class buildLoadedListWidget extends StatelessWidget {
  const buildLoadedListWidget();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: blue,
        child: Column(
          children: [buildCharactersList()],
        ),
      ),
    );
  }
}
