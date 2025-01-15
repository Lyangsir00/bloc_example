import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<IncrementCounter>(_increment);
    on<DecrementCounter>(_decrement);
  }
  /**
   * Increments the counter value by 1
   * 
   * This method is called when IncrementCounter event is triggered.
   * 
   */
  void _increment(IncrementCounter event, Emitter<CounterState> emit) {
    emit(
      state.copyWith(counter: state.counter + 1),
    );
  }

  /**
   * Decrements the counter value by 1
   * 
   * This method is called when DecrementCounter event is triggered.
   * 
   */
  void _decrement(DecrementCounter event, Emitter<CounterState> emit) {
    emit(
      state.copyWith(counter: state.counter - 1),
    );
  }
}
