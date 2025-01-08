import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/bloc/counter/counter_bloc.dart';
import 'package:flutter_bloc_example/ui/coounter/counter_screen3.dart';

class CounterScreen2 extends StatefulWidget {
  const CounterScreen2({super.key});

  @override
  State<CounterScreen2> createState() => _CounterScreen2State();
}

class _CounterScreen2State extends State<CounterScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CounterScreen 2"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              return Text(
                state.counter.toString(),
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  context.read<CounterBloc>().add(IncrementCounter());
                },
                child: Text("Increment"),
              ),
              SizedBox(
                width: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<CounterBloc>().add(DecrementCounter());
                },
                child: Text("Decrement"),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CounterScreen3(),
            ),
          );
        },
        child: Text("Next"),
      ),
    );
  }
}
