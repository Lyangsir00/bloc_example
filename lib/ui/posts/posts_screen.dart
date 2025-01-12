import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/bloc/posts/bloc/posts_bloc.dart';
import 'package:flutter_bloc_example/ui/counter/counter_screen.dart';
import 'package:flutter_bloc_example/ui/switch/switch_screen.dart';
import 'package:flutter_bloc_example/utils/enums.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  void toggle() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => SwitchScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts Page"),
        actions: [
          InkWell(
            onDoubleTap: () => toggle(),
            child: const Text(
              "Toggle switch",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          InkWell(
            child: const Text("Counter app",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => CounterScreen()));
            },
          ),
        ],
      ),
      body: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          if (state.postStatus == PostStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(10),
                  color: const Color.fromARGB(255, 222, 152, 234),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        state.postList[index].id.toString(),
                      ),
                      Text(
                        state.postList[index].title.toString(),
                      ),
                      Text(
                        state.postList[index].body.toString(),
                      ),
                    ],
                  ),
                );
              },
              itemCount: state.postList.length,
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<PostsBloc>().add(PostFetch());
        },
        child: const Center(child: Icon(Icons.ads_click)),
      ),
    );
  }
}
