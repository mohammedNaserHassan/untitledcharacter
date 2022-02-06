import 'dart:ui';

import 'package:flutter/cupertino.dart';

import 'Data/Models/Character.dart';

final baseUrl = "https://www.breakingbadapi.com/api/";
const charactersScreen = '/';
const characterDetailsScreen = '/character_details';
final Color blue = const Color(0xff956DAA);
final Color grey = const Color(0xff343A40);
final Color white = const Color(0xffE1E8EB);

List<Character> allCharacters;
TextEditingController searchController = TextEditingController();
List<Character> searchedForCharacters;
bool isSearch = false;