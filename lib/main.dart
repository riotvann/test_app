import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/presentation/pages/user_feed.dart';
import 'package:test_app/presentation/pages/user_feed/bloc/user_feed_bloc.dart';
import 'package:test_app/presentation/pages/user_feed/bloc/user_feed_event.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (BuildContext context) =>
            UserFeedBloc()..add(GetUserFeedEvent()),
        child: UserFeed(),
      ),
    );
  }
}
