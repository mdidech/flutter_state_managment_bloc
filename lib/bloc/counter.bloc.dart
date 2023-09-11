import 'package:bloc/bloc.dart';

abstract class CounterEvent {}

class IncrementCounterEvent extends CounterEvent {}

class DecrementCounterEvent extends CounterEvent {}

class AddValueToCounterValue extends CounterEvent {
  int value;

  AddValueToCounterValue({required this.value});
}

abstract class CounterState {
  final int counter;
  CounterState({required this.counter});
}

class CounterSuccessState extends CounterState {
  CounterSuccessState({required super.counter});
}

class CounterErrorState extends CounterState {
  final String errorMessage;
  CounterErrorState({required super.counter, required this.errorMessage});
}

class InitialState extends CounterState {
  InitialState() : super(counter: 0);
}

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(InitialState()) {
    on((IncrementCounterEvent event, emit) {
      if (state.counter < 10) {
        emit(CounterSuccessState(counter: state.counter + 1));
      } else {
        emit(CounterErrorState(
            counter: state.counter,
            errorMessage: "The counter value can not exceed 10"));
      }
    });
    on((DecrementCounterEvent event, emit) {
      if (state.counter > 0) {
        emit(CounterSuccessState(counter: state.counter - 1));
      } else {
        emit(CounterErrorState(
            counter: state.counter,
            errorMessage: "The counter can not be less than 0"));
      }
    });
    on((AddValueToCounterValue event, emit) {
      if (state.counter < 10 - event.value) {
        emit(CounterSuccessState(counter: state.counter + event.value));
      } else {
        emit(CounterErrorState(
            counter: state.counter,
            errorMessage: "The counter can not be less than 0"));
      }
    });
  }
}
