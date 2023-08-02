part of 'counter_bloc.dart';

final class CounterState extends Equatable {
  final int counterValue;

  const CounterState({required this.counterValue});

  @override
  List<Object> get props => [counterValue];
}

final class CounterInitial extends CounterState {
  const CounterInitial() : super(counterValue: 0);
}

final class IncrementState extends CounterState {
  const IncrementState(int value) : super(counterValue: value);
}

final class DecrementState extends CounterState {
  const DecrementState(int value) : super(counterValue: value);
}
