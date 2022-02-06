import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitledcharacter/Business%20logic/characters_cubit.dart';
import 'package:untitledcharacter/Data/Models/Character.dart';
import 'package:untitledcharacter/UI/Widgets/buildDivider.dart';
import 'package:untitledcharacter/UI/Widgets/buildSliverAppBar.dart';
import 'package:untitledcharacter/UI/Widgets/characterInfo.dart';
import 'package:untitledcharacter/UI/Widgets/displayRandomQuoteOrEmptySpace.dart';
import 'package:untitledcharacter/UI/Widgets/showLoadingIndicator.dart';
import 'package:untitledcharacter/constants.dart';

class character_details extends StatelessWidget {
  final Character character;

  character_details({this.character});

  Widget checkIfQuotesAreLoaded(CharactersState state) {
    if (state is QuotesLoaded) {
      return displayRandomQuoteOrEmptySpace(state);
    } else {
      return showLoadingIndicator();
    }
  }

  Widget displayRandomQuoteOrEmptySpace(state) {
    var quotes = (state).quotes;
    if (quotes.length != 0) {
      int randomQuoteIndex = Random().nextInt(quotes.length - 1);
      return displayWidget(
        random: randomQuoteIndex,
        quotes: quotes,
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CharactersCubit>(context).getQuotes(character.name);
    return Scaffold(
      backgroundColor: grey,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(
            character: character,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding: EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      characterInfo(
                          title: 'Job : ', value: character.jobs.join(' / ')),
                      buildDivider(315),
                      characterInfo(
                          title: 'Appeared in : ',
                          value: character.categoryForTwoSeries),
                      buildDivider(250),
                      characterInfo(
                          title: 'Seasons : ',
                          value: character.appearanceOfSeasons.join(' / ')),
                      buildDivider(280),
                      characterInfo(
                          title: 'Status : ',
                          value: character.statusIfDeadOrLive),
                      buildDivider(300),
                      character.betterCallSaulAppearance.isEmpty
                          ? Container()
                          : characterInfo(
                              title: 'Better Call Saul Seasons : ',
                              value: character.betterCallSaulAppearance
                                  .join(" / ")),
                      character.betterCallSaulAppearance.isEmpty
                          ? Container()
                          : buildDivider(150),
                      characterInfo(
                          title: 'Actor/Actress : ',
                          value: character.actorName),
                      buildDivider(235),
                      SizedBox(
                        height: 20,
                      ),
                      BlocBuilder<CharactersCubit, CharactersState>(
                        builder: (context, state) {
                          return checkIfQuotesAreLoaded(state);
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 500,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
