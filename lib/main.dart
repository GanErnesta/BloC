import 'package:state_bloc/CounterBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: Scaffold(
        body: BlocProvider(
          create: (BuildContext context) => CounterBloc(),
          child: const CounterScreen(),
        ),
      ),
    );
  }
}

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);

    return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          BlocBuilder<CounterBloc, int>(
            builder: (BuildContext context, int count) {
              return Text(
                'Nilai: $count',
                style: Theme.of(context).textTheme.headline4,
              );
            },
          ),
          SizedBox(height: 10,),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                child: Text("Kurang"),
                onPressed: () {
                  counterBloc.add(CounterEvent.decrement);
                },
              ),
              ElevatedButton(
                child: Text("Tambah"),
                onPressed: () {
                  counterBloc.add(CounterEvent.increment);
                },
              ),
            ],
          )
        ]));
  }
}
