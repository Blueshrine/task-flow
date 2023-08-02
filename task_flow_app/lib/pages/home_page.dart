import 'package:flutter/material.dart';

import '../bloc/exported_blocs.dart';

final class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Flow'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FloatingActionButton(
            tooltip: 'Increment Counter',
            onPressed: () {
              return context.read<CounterBloc>().add(CounterIncrementEvent());
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 15),
          FloatingActionButton(
            tooltip: 'Decrement Counter',
            onPressed: () {
              return context.read<CounterBloc>().add(CounterDecrementEvent());
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: BlocListener<CounterBloc, CounterState>(
            listener: (context, state) {
              if (state is IncrementState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Successfully increased.'),
                    duration: Duration(milliseconds: 300),
                  ),
                );
              } else if (state is DecrementState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Successfully decreased.'),
                    duration: Duration(milliseconds: 300),
                  ),
                );
              }
            },
            child: BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Text('Counter Value: ${state.counterValue}');
              },
            ),
          ),
        ),
      ),
    );
  }
}
