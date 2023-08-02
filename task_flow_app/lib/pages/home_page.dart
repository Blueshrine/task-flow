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
          child: BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              return Text('Counter Value: ${state.counterValue}');
            },
          ),
        ),
      ),
    );
  }
}
