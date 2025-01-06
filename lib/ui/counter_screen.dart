import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              return Center(
                child: Text(
                  state.counter.toString(),
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
                child: Text("incrememt"),
              ),
              SizedBox(
                width: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(
                          DecrementCounter(),
                        );
                  },
                  child: Text("Decrement"))
            ],
          )
        ],
      ),
    );
  }
}
