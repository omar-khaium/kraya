import 'package:bloc/bloc.dart';

part 'bottom_navigation_state.dart';

class BottomNavigationCubit extends Cubit<BottomNavigationState> {
  BottomNavigationCubit() : super(const BottomNavigationState(index: 0));

  void changePage(int newIndex) => emit(BottomNavigationState(index: newIndex));
}
