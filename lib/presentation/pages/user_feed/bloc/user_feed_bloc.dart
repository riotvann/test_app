import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:test_app/data/models/user_model.dart';
import 'package:test_app/presentation/pages/user_feed/bloc/user_feed_event.dart';
import 'package:test_app/presentation/pages/user_feed/bloc/user_feed_state.dart';

import 'package:http/http.dart' as http;

class UserFeedBloc extends Bloc<UserFeedEvent, UserFeedState> {
  UserFeedBloc() : super(UserFeedInitialState()) {
    on<GetUserFeedEvent>(_getUsers);
  }

  Future _getUsers(GetUserFeedEvent event, Emitter emit) async {
    emit(GetUserFeedLoadingState());

    final response =
        await http.get(Uri.parse("https://jserver-api.herokuapp.com/users"));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List;
      final userList = data.map((json) => UserModel.fromJson(json)).toList();
      emit(GetUserFeedSuccessState(userList));
    } else {
      emit(GetUserFeedFailureState());
    }
  }
}
