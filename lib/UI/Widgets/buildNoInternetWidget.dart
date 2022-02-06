import 'package:flutter/material.dart';

import '../../constants.dart';
class buildNoInternetWidget extends StatelessWidget {
  const buildNoInternetWidget();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'Can\'t connect .. check internet',
              style: TextStyle(
                fontSize: 22,
                color: grey,
              ),
            ),
            Image.asset('assets/images/no_internet.png')
          ],
        ),
      ),
    );
  }
}
