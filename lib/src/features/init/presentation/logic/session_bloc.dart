import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'session_event.dart';
part 'session_state.dart';

class SessionBloc extends HydratedBloc<SessionEvent, SessionState?> {
  SessionBloc() : super(null) {
    on<SessionEvent>((event, emit) {
      if (event is LoginEvent) {
        emit(const SessionState());
      } else if (event is LogoutEvent) {
        emit(null);
      } else if (event is TapSession) {
        emit(state == null ? null : const SessionState());
      }
    });
  }

  @override
  SessionState? fromJson(Map<String, dynamic>? json) {
    return json == null ? null : SessionState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(SessionState? state) {
    return state?.toJson();
  }
}
