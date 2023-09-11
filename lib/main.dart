import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_state_managment_bloc/Counter.page.bloc.dart";
import "package:flutter_state_managment_bloc/Counter.page.stateful.dart";
import "package:flutter_state_managment_bloc/bloc/counter.bloc.dart";
// import "package:flutter_state_managment_bloc/Counter.page.stateless.dart";

void main() {
  runApp(MyCounterApp());
}

class MyCounterApp extends StatelessWidget {
  const MyCounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => CounterBloc())],
      child: MaterialApp(
        routes: {
          "/": (context) => CounterPageBloc(),
        },
      ),
    );
  }
}
