import 'package:bloc_app/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
      );
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // final String title;
  final _bloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc Example"),
      ),
      body: Center(
        child: StreamBuilder(
          initialData: 0,
          stream: _bloc.counter,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Bloc App',
                ),
                Text(
                  snapshot.data.toString(),
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            );
          },
        ),
      ),

      // buttons
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () => _bloc.CounterEventSink.add(IncrementEvent()),
            tooltip: 'add',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () => _bloc.CounterEventSink.add(DecrementEvent()),
            tooltip: 'remove',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }
}
