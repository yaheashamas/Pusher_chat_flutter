import 'package:chat/core/router/route_constants.dart';
import 'package:chat/core/screens/main_layer_screen.dart';
import 'package:chat/di.dart';
import 'package:chat/features/auth/presentation/blocs/user_cubit/user_cubit.dart';
import 'package:chat/features/auth/presentation/blocs/user_cubit/user_state.dart';
import 'package:chat/features/auth/presentation/blocs/validate_bloc/validate_bloc.dart';
import 'package:chat/features/auth/presentation/blocs/validate_bloc/validate_event.dart';
import 'package:chat/features/auth/presentation/blocs/validate_bloc/validate_state.dart';
import 'package:chat/features/auth/presentation/widgets/custom_button.dart';
import 'package:chat/features/auth/presentation/widgets/custom_formfield.dart';
import 'package:chat/features/auth/presentation/widgets/custom_richtext.dart';
import 'package:chat/features/auth/presentation/widgets/pop_up/custom_pop_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late UserCubit userCubit;
  late ValidateBloc validateBloc;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    userCubit = getIt.get<UserCubit>();
    validateBloc = userCubit.validateBloc;
    super.initState();
  }

  @override
  void deactivate() {
    emailController.dispose();
    passwordController.dispose();
    userCubit.close();
    validateBloc.close();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => userCubit),
        BlocProvider(create: (context) => validateBloc),
      ],
      child: Scaffold(
        body: MainLayerScreen(
          title: "Login",
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width * 0.8,
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.09),
                  child: Image.asset("assets/images/login.png"),
                ),
                const SizedBox(height: 24),
                BlocBuilder<ValidateBloc, ValidateState>(
                  builder: (context, state) {
                    return CustomFormField(
                      headingText: "Email",
                      hintText: "Email",
                      obsecureText: false,
                      suffixIcon: const SizedBox(),
                      controller: emailController,
                      maxLines: 1,
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.emailAddress,
                      errorText: state.email.invalid ? state.email.error : null,
                      onChanged: (value) =>
                          validateBloc.add(ValidateEmailEvent(value)),
                    );
                  },
                ),
                const SizedBox(height: 24),
                BlocBuilder<ValidateBloc, ValidateState>(
                  builder: (context, state) {
                    return CustomFormField(
                      headingText: "Password",
                      maxLines: 1,
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.text,
                      hintText: "At least 8 Character",
                      obsecureText: state.passView,
                      suffixIcon: IconButton(
                        icon: Icon(state.passView
                            ? Icons.visibility
                            : Icons.visibility_off_sharp),
                        onPressed: () =>
                            validateBloc.add(ValidatePassViewEvent()),
                      ),
                      controller: passwordController,
                      errorText:
                          state.password.invalid ? state.password.error : null,
                      onChanged: (value) =>
                          validateBloc.add(ValidatePasswordEvent(value)),
                    );
                  },
                ),
                const SizedBox(height: 40),
                BlocListener<UserCubit, UserState>(
                  listener: (context, state) {
                    if (state is UserLoginSuccessState) {
                      showPopup(context, "success Login", Colors.green);
                      Navigator.of(context)
                          .pushReplacementNamed(RouteList.chatList);
                    } else if (state is UserLoginErrorState) {
                      showPopup(context, state.error, Colors.red);
                    }
                  },
                  child: Container(),
                ),
                BlocBuilder<ValidateBloc, ValidateState>(
                  builder: (context, state) {
                    return AuthButton(
                      onTap: state.isSubmitLogin
                          ? () => userCubit.loginUser()
                          : () {
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("colpate the information plase"),
                              ));
                            },
                      text: 'Sign In',
                    );
                  },
                ),
                CustomRichText(
                  discription: "Don't already Have an account? ",
                  text: "Sign Up",
                  onTap: () {
                    Navigator.of(context).pushNamed(RouteList.register);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
