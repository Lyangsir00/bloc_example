part of 'counter_bloc.dart';

class CounterState extends Equatable {
  final int counter;
  const CounterState({this.counter = 0});
//copyWith is used to create new instance of the class which helps to override the value of that counter.
  CounterState copyWith({int? counter}) {
    return CounterState(counter: counter ?? this.counter);
  }

  @override
  List<Object> get props => [counter];
}
