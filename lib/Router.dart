import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitledcharacter/Business%20logic/characters_cubit.dart';
import 'package:untitledcharacter/Data/API/CharacterServices.dart';
import 'package:untitledcharacter/Data/Repository/characterRepository.dart';
import 'package:untitledcharacter/UI/Screens/characterScreen.dart';
import 'package:untitledcharacter/UI/Screens/details_characters.dart';

import 'Data/Models/Character.dart';
import 'constants.dart';

class AppRouter{
 CharacterRepository characterRepository;
 CharactersCubit charactersCubit;
 AppRouter(){
   characterRepository= CharacterRepository(CharacterServices());
   charactersCubit=CharactersCubit(characterRepository);
 }
 Route generateRoute(RouteSettings settings) {
   switch (settings.name) {
     case charactersScreen:
       return MaterialPageRoute(
         builder: (_) => BlocProvider(
           create: (BuildContext contxt) => charactersCubit,
           child: characterScreen(),
         ),
       );
     case characterDetailsScreen:
       final character = settings.arguments as Character;

       return MaterialPageRoute(
         builder: (_) => BlocProvider(
           create: (BuildContext context) =>
               CharactersCubit(characterRepository),
           child: character_details(
             character: character,
           ),
         ),
       );
   }
 }
 }
