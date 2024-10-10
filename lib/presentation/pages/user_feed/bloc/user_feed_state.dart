import 'package:equatable/equatable.dart';
import 'package:test_app/domain/user.dart';

sealed class UserFeedState extends Equatable {
  const UserFeedState();

  @override
  List<Object?> get props => [];
}

class UserFeedInitialState extends UserFeedState {}

class GetUserFeedLoadingState extends UserFeedState {}

class GetUserFeedSuccessState extends UserFeedState {
  final List<User> userList;

  const GetUserFeedSuccessState(this.userList);
}

class GetUserFeedFailureState extends UserFeedState {}
