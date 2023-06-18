part of 'language_cubit.dart';

class LanguageState {
  late String languageSelection;
  LanguageState({required this.languageSelection});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'language': languageSelection,
    };
  }
  factory LanguageState.fromMap(Map<String, dynamic> map) {
    return LanguageState(
      languageSelection: map['language'] as String,
     
    );
  }
}
