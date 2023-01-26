import 'package:chat/core/extensions/widget_extenstion.dart';
import 'package:chat/core/router/route_constants.dart';
import 'package:chat/di.dart';
import 'package:chat/features/auth/presentation/blocs/login_cubit/login_cubit.dart';
import 'package:chat/features/auth/presentation/blocs/login_cubit/login_state.dart';
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
  late LoginCubit loginCubit;
  late ValidateBloc validateBloc;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    loginCubit = getIt.get<LoginCubit>();
    validateBloc = loginCubit.validateBloc;
    super.initState();
  }

  @override
  void deactivate() {
    emailController.dispose();
    passwordController.dispose();
    loginCubit.close();
    validateBloc.close();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => loginCubit),
        BlocProvider(create: (context) => validateBloc),
      ],
      child: Scaffold(
        body: Column(
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
                    onPressed: () => validateBloc.add(ValidatePassViewEvent()),
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
            BlocListener<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is LoginSuccessState) {
                  showPopup(context, "success Login", Colors.green);
                } else if (state is LoginErrorState) {
                  showPopup(context, state.error, Colors.red);
                }
              },
              child: Container(),
            ),
            BlocBuilder<ValidateBloc, ValidateState>(
              builder: (context, state) {
                return AuthButton(
                  onTap: state.isSubmitLogin
                      ? () => loginCubit.loginUser()
                      : () {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
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
        ).mainLayer(context, "Login", false),
      ),
    );
  }
}
