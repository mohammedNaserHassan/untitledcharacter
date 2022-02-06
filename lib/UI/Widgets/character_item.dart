import 'package:flutter/material.dart';
import 'package:untitledcharacter/Data/Models/Character.dart';
import 'package:untitledcharacter/constants.dart';

class character_item extends StatelessWidget {
  final Character character;

  character_item({this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8, 6, 6, 8),
      padding: EdgeInsetsDirectional.all(5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: ()=>Navigator.pushNamed(context, characterDetailsScreen,arguments: character),
        child: GridTile(
          child: Hero(
            tag: character.charID,
            child: Container(
              color: Colors.white,
              child: character.image.isNotEmpty
                  ? FadeInImage.assetNetwork(
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                      placeholder: 'assets/images/loading.gif',
                      image: character.image)
                  : Image.asset('assets/images/place.jpg'),
            ),
          ),
          footer: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            color: Colors.white60,
            alignment: Alignment.bottomCenter,
            child: Text(
              '${character.name}',
              style: TextStyle(
                  height: 1.3,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: white),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
