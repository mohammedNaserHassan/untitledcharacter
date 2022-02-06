import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitledcharacter/Business%20logic/characters_cubit.dart';
import 'package:untitledcharacter/UI/Widgets/showLoadingIndicator.dart';

import '../../constants.dart';
import 'buildLoadedListWidget.dart';
class buildBlocWidget extends StatelessWidget {
  const buildBlocWidget();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          allCharacters = (state).characters;
          return buildLoadedListWidget();
        } else {
          return showLoadingIndicator();
        }
      },
    );
  }
}
