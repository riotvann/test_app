import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/domain/user.dart';
import 'package:test_app/presentation/pages/user_feed/bloc/user_feed_bloc.dart';
import 'package:test_app/presentation/pages/user_feed/bloc/user_feed_state.dart';

class UserFeed extends StatelessWidget {
  UserFeed({super.key});

  final userTest = User(
      id: 1,
      firstName: 'John',
      lastName: 'Doe',
      username: 'dondon',
      email: 'johndoe@email.com',
      gender: 'male',
      pictureURL: "https://randomuser.me/api/portraits/men/1.jpg",
      phone: 'phone',
      birthday: DateTime.now(),
      twitterHandle: 'twitterHandle');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('user feed'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: BlocBuilder<UserFeedBloc, UserFeedState>(
            builder: (context, state) {
              return switch (state) {
                UserFeedInitialState() => const Center(
                    child: CircularProgressIndicator(),
                  ),
                GetUserFeedLoadingState() => const Center(
                    child: CircularProgressIndicator(),
                  ),
                GetUserFeedSuccessState() => ListView.builder(
                    itemCount: state.userList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              NetworkImage(state.userList[index].pictureURL),
                        ),
                        title: Text(
                            "${state.userList[index].firstName} ${state.userList[index].lastName}"),
                        subtitle: Text(state.userList[index].email),
                      );
                    },
                  ),
                GetUserFeedFailureState() => throw UnimplementedError()
              };
            },
          )),
    );
  }
}
