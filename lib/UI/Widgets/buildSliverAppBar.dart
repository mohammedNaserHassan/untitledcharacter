import 'package:flutter/material.dart';
import 'package:untitledcharacter/Data/Models/Character.dart';

import '../../constants.dart';
class buildSliverAppBar extends StatelessWidget {
  Character character;
   buildSliverAppBar({this.character});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: grey,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          character.nickName,
          style: TextStyle(color: white),
        ),
        background: Hero(
          tag: character.charID,
          child: Image.network(
            character.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
