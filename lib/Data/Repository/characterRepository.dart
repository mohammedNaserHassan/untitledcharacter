import 'package:untitledcharacter/Data/API/CharacterServices.dart';
import 'package:untitledcharacter/Data/Models/Character.dart';
import 'package:untitledcharacter/Data/Models/Quote.dart';

class CharacterRepository {
  final CharacterServices characterServices;

  CharacterRepository(this.characterServices);

  Future<List<Character>> getAllCharacters() async {
    final characters = await characterServices.getAllCharacters();
    return characters
        .map((character) => Character.fromJson(character))
        .toList();
  }

  Future<List<Quote>> getCharacterQuotes(String charName) async {
    final quotes = await characterServices.getCharacterQuotes(charName);
    return quotes.map((charQuotes) => Quote.fromJson(charQuotes)).toList();
  }

}
