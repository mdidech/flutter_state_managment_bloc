import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_state_managment_bloc/bloc/counter.bloc.dart";

class CounterPageBloc extends StatelessWidget {
  int counter = 0;
  CounterPageBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Page V1'),
      ),
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            if (state is CounterSuccessState || state is InitialState) {
              return Text(
                "Counter Value => ${state.counter}",
                style: TextStyle(fontSize: 25),
              );
            } else if (state is CounterErrorState) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Counter Value => ${state.counter}",
                    style: TextStyle(fontSize: 25, color: Colors.red),
                  ),
                  Text(
                    "${state.errorMessage}",
                    style: TextStyle(fontSize: 25, color: Colors.red),
                  )
                ],
              );
            } else {
              return Container();
            }
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(DecrementCounterEvent());
            },
            child: const Icon(Icons.remove),
          ),
          const SizedBox(
            width: 15,
          ),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(IncrementCounterEvent());
            },
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(AddValueToCounterValue(value: 2));
            },
            child: const Icon(Icons.two_k_plus),
          ),
        ],
      ),
    );
  }
}
