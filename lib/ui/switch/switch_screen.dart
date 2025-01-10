import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/bloc/switch/switch_bloc.dart';

class SwitchScreen extends StatefulWidget {
  const SwitchScreen({super.key});

  @override
  State<SwitchScreen> createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Notification"),
              BlocBuilder<SwitchBloc, SwitchState>(
                buildWhen: (previous, current) =>
                    previous.isSwitch != current.isSwitch,
                builder: (context, state) {
                  return Switch(
                    value: state.isSwitch,
                    onChanged: (newValue) {
                      context.read<SwitchBloc>().add(
                            EnableDisableNotification(),
                          );
                    },
                  );
                },
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          BlocBuilder<SwitchBloc, SwitchState>(
            buildWhen: (previous, current) => previous.slider != current.slider,
            builder: (context, state) {
              return Container(
                height: 200,
                color: Colors.red.withOpacity(state.slider),
              );
            },
          ),
          SizedBox(
            height: 20,
          ),
          BlocBuilder<SwitchBloc, SwitchState>(
            builder: (context, state) {
              return Slider(
                value: state.slider,
                onChanged: (value) {
                  context.read<SwitchBloc>().add(
                        SliderEvent(slider: value),
                      );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
