import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/bloc/counter/counter_bloc.dart';
import 'package:flutter_bloc_example/ui/counter/counter_screen2.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CounterScreen1"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              return Center(
                child: Text(
                  state.counter.toString(),
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  context.read<CounterBloc>().add(
                        IncrementCounter(),
                      );
                },
                child: const Text("incrememt"),
              ),
              const SizedBox(
                width: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(
                          DecrementCounter(),
                        );
                  },
                  child: const Text("Decrement"))
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CounterScreen2(),
            ),
          );
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
