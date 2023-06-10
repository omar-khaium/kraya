import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router.dart';
import '../logic/session_bloc.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  void initState() {
    context.read<SessionBloc>().add(TapSession());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SessionBloc, SessionState?>(
      listener: (_, state) {
        context.goNamed(state == null ? RouteNames.login : RouteNames.dashboard);
      },
      child: const Placeholder(),
    );
  }
}
