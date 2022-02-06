import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitledcharacter/Data/Models/Character.dart';
import 'package:untitledcharacter/Data/Models/Quote.dart';
import 'package:untitledcharacter/Data/Repository/characterRepository.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  List<Character> characters=[];
  final CharacterRepository characterRepository;

  CharactersCubit(this.characterRepository) : super(CharactersInitial());

  List<Character> getAllCharacters() {
    characterRepository.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters));
      this.characters = characters;
    });
    return characters;
  }

  void getQuotes(String charName) {
    characterRepository.getCharacterQuotes(charName).then((quotes) {
      emit(QuotesLoaded(quotes));
    });
  }

}
