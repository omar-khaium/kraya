part of 'language_cubit.dart';

class LanguageState {
  late LanguageEnum languageSelection;
  LanguageState({required this.languageSelection});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'language': languageSelection.index,
    };
  }

  factory LanguageState.fromMap(Map<String, dynamic> map) {
    return LanguageState(
      languageSelection: LanguageEnum.values.elementAt(map['language'] ?? 0),
    );
  }
}
