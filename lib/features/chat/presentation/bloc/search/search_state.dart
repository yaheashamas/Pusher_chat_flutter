import 'package:equatable/equatable.dart';

import 'package:chat/features/auth/domain/entities/user/user_model.dart';

class SearchState extends Equatable {
  final List<UserModel> users;
  final List<UserModel> usersSearch;

  factory SearchState.inital() {
    return const SearchState(users: [], usersSearch: []);
  }
  const SearchState({
    required this.users,
    required this.usersSearch,
  });

  @override
  List<Object> get props => [users, usersSearch];

  SearchState copyWith({
    List<UserModel>? users,
    List<UserModel>? usersSearch,
  }) {
    return SearchState(
      users: users ?? this.users,
      usersSearch: usersSearch ?? this.usersSearch,
    );
  }
}
