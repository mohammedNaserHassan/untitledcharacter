import 'package:flutter/material.dart';

import '../../constants.dart';
import 'character_item.dart';
class buildCharactersList extends StatelessWidget {
  const buildCharactersList();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: searchController.text.isEmpty
            ? allCharacters.length
            : searchedForCharacters.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
            mainAxisSpacing: 0,
            crossAxisSpacing: 0),
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          return character_item(
            character: searchController.text.isEmpty
                ? allCharacters[index]
                : searchedForCharacters[index],
          );
        });
  }
}
