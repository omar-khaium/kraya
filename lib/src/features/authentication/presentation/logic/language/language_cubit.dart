import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../../../../core/enums.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> with HydratedMixin {
  LanguageCubit() : super(LanguageState(languageSelection: LanguageEnum.english));

  @override
  LanguageState? fromJson(Map<String, dynamic> json) {
    return LanguageState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(LanguageState state) {
    return state.toMap();
  }

  void saveLanguageSelection(LanguageEnum languageEnum) {
    try {
      emit(LanguageState(languageSelection: languageEnum));
    } catch (error) {
      emit(state);
    }
  }
}
