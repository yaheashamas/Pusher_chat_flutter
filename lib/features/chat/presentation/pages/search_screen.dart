import 'package:chat/core/router/route_constants.dart';
import 'package:chat/core/screens/main_layer_screen.dart';
import 'package:chat/di.dart';
import 'package:chat/features/auth/presentation/widgets/custom_formfield.dart';
import 'package:chat/features/chat/presentation/bloc/chat/chat_bloc.dart';
import 'package:chat/features/chat/presentation/bloc/chat/chat_event.dart';
import 'package:chat/features/chat/presentation/bloc/search/search_cubit.dart';
import 'package:chat/features/chat/presentation/bloc/search/search_state.dart';
import 'package:chat/features/chat/presentation/widgets/custom_item_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController searchController;
  late SearchCubit searchCubit;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    searchCubit = getIt.get<SearchCubit>();
    searchCubit.getAllUsers();
  }

  @override
  void dispose() {
    searchController.dispose();
    searchCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => searchCubit,
      child: Scaffold(
        body: MainLayerScreen(
          title: "Search",
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.11,
                  child: BlocBuilder<SearchCubit, SearchState>(
                    builder: (context, state) {
                      return CustomFormField(
                        headingText: "",
                        hintText: "search",
                        obsecureText: false,
                        suffixIcon: const SizedBox(),
                        controller: searchController,
                        maxLines: 1,
                        textInputAction: TextInputAction.done,
                        textInputType: TextInputType.emailAddress,
                        onChanged: (q) => searchCubit.searchUser(q),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.9,
                  child: BlocBuilder<SearchCubit, SearchState>(
                    builder: (context, state) {
                      if (state.usersSearch.isEmpty) {
                        return Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(Icons.person_outline_sharp),
                              Text("No Users")
                            ],
                          ),
                        );
                      }
                      return ListView.separated(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: state.usersSearch.length,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        itemBuilder: (context, index) => CustomItemUser(
                          onTap: () {
                            context
                                .read<ChatBloc>()
                                .add(UserSelectedEvent(state.users[index]));
                            Navigator.of(context).pushNamed(RouteList.chat);
                          },
                          name: state.users[index].username,
                          email: state.users[index].email,
                        ),
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 10),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
