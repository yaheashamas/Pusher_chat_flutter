import 'package:chat/features/auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:dio/dio.dart';

class Api {
  static var options = BaseOptions(
    baseUrl: 'http://192.168.1.107:5000',
    receiveDataWhenStatusError: true,
  );
  static final Dio dio = Dio(options);

  static initializeInterceptors() async {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (request, handler) async {
          var headers = {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            "Authorization": "Bearer ${AuthCubit().state.token ?? ""}"
          };
          print("${request.method} ${request.path}");
          print("${request.headers} $headers");
          request.headers.addAll(headers);
          return handler.next(request);
        },
        onResponse: (response, handler) async {
          print(response.data.toString());
          return handler.next(response);
        },
        onError: (error, handler) {
          print('error => ${error.response}');
          print('handler => $handler');
          return handler.next(error);
        },
      ),
    );
  }
}
