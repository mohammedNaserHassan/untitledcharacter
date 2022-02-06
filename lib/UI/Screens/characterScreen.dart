import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:untitledcharacter/Business%20logic/characters_cubit.dart';
import 'package:untitledcharacter/UI/Widgets/buildAppBarTitle.dart';
import 'package:untitledcharacter/UI/Widgets/buildBlocWidget.dart';
import 'package:untitledcharacter/UI/Widgets/buildNoInternetWidget.dart';
import 'package:untitledcharacter/UI/Widgets/showLoadingIndicator.dart';
import 'package:untitledcharacter/constants.dart';

class characterScreen extends StatefulWidget {
  const characterScreen();

  @override
  State<characterScreen> createState() => _characterScreenState();
}

class _characterScreenState extends State<characterScreen> {
  @override
  void addSearchedFOrItemsToSearchedList(String searchChar) {
    searchedForCharacters = allCharacters
        .where(
            (character) => character.name.toLowerCase().startsWith(searchChar))
        .toList();
    setState(() {});
  }

  List<Widget> _buildAppBarActions() {
    if (isSearch) {
      return [
        IconButton(
          onPressed: () {
            _clearSearch();
            Navigator.pop(context);
          },
          icon: Icon(Icons.clear, color: white),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: _startSearch,
          icon: Icon(
            Icons.search,
            color: white,
          ),
        ),
      ];
    }
  }

  Widget buildSearchField() {
    return TextField(
      controller: searchController,
      cursorColor: white,
      decoration: InputDecoration(
        hintText: 'Find a character...',
        border: InputBorder.none,
        hintStyle: TextStyle(color: white, fontSize: 18),
      ),
      style: TextStyle(color: white, fontSize: 18),
      onChanged: (searchedCharacter) {
        addSearchedFOrItemsToSearchedList(searchedCharacter);
      },
    );
  }

  @override
  void initState() {
    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blue,
      appBar: AppBar(
        leading: isSearch
            ? BackButton(
                color: white,
              )
            : Container(),
        backgroundColor: blue,
        elevation: 0,
        title: isSearch ? buildSearchField() : buildAppBarTitle(),
        actions: _buildAppBarActions(),
      ),
      body: OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
        ) {
          final bool connected = connectivity != ConnectivityResult.none;

          if (connected) {
            return buildBlocWidget();
          } else {
            return buildNoInternetWidget();
          }
        },
        child: showLoadingIndicator(),
      ),
    );
  }

  void _startSearch() {
    ModalRoute.of(context)
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));

    setState(() {
      isSearch = true;
    });
  }

  void _stopSearching() {
    _clearSearch();
    setState(() {
      isSearch = false;
    });
  }

  void _clearSearch() {
    setState(() {
      searchController.clear();
    });
  }
}
