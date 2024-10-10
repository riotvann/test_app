import 'package:equatable/equatable.dart';

sealed class UserFeedEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetUserFeedEvent extends UserFeedEvent {}
