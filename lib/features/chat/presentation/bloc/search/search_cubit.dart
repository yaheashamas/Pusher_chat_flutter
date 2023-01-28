import 'package:chat/core/extensions/faliure_extention.dart';
import 'package:chat/features/auth/domain/usecases/get_all_users_use_case.dart';
import 'package:chat/features/auth/presentation/blocs/loading_cubit/loading_cubit.dart';
import 'package:chat/features/chat/presentation/bloc/search/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchState> {
  LoadingCubit loadingCubit;
  GetAllUsersUseCase getAllUsersUseCase;
  SearchCubit(
    this.getAllUsersUseCase,
    this.loadingCubit,
  ) : super(SearchState.inital());

  getAllUsers() async {
    loadingCubit.show();
    var result = await getAllUsersUseCase();
    emit(result.fold(
      (l) => state.copyWith(),
      (r) => state.copyWith(users: r),
    ));
    loadingCubit.hide();
  }

  searchUser(String q) async {
    ;
    emit(state.copyWith(
        usersSearch:
            state.users.where((item) => item.username.contains(q)).toList()));
  }
}
