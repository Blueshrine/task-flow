import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

final class CounterBloc extends HydratedBloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterInitial()) {
    on<CounterIncrementEvent>((event, emit) {
      emit(IncrementState(state.counterValue + 1));
    });
    on<CounterDecrementEvent>((event, emit) {
      emit(DecrementState(state.counterValue - 1));
    });
  }

  @override
  CounterState? fromJson(Map<String, dynamic> json) {
    return CounterState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(CounterState state) => state.toMap();
}
