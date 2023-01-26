import 'package:laravel_echo/laravel_echo.dart';
import 'package:pusher_client/pusher_client.dart';

class LaravelEcho {
  static LaravelEcho? _singleton;
  static late Echo _echo;
  final String token;

  static Echo get instance => _echo;
  static String get socketId => _echo.socketId() ?? "11111.11111111";

  LaravelEcho._({required this.token}) {
    _echo = createLaravelEcho(token);
  }

  factory LaravelEcho.inital({
    required String token,
  }) {
    if (_singleton == null || token != _singleton?.token) {
      _singleton = LaravelEcho._(token: token);
    }
    return _singleton!;
  }
}

Echo createLaravelEcho(String token) {
  return Echo(
    client: createPusherClient(token),
    broadcaster: EchoBroadcasterType.Pusher,
  );
}

PusherClient createPusherClient(String token) {
  PusherOptions options = PusherOptions(
    wsPort: PusherConfig.port,
    encrypted: true,
    host: PusherConfig.hostEndPoint,
    cluster: PusherConfig.cluster,
    auth: PusherAuth(
      PusherConfig.hostAuthEndPoint,
      headers: {
        "Accept": "application/json",
        "content-type": "application/json",
        "Authorization": "Bearer $token",
      },
    ),
  );
  PusherClient pusherClient = PusherClient(
    PusherConfig.key,
    options,
    autoConnect: false,
    enableLogging: true,
  );
  return pusherClient;
}

class PusherConfig {
  static const appId = "1533161";
  static const key = "557e9e0112af663db05b";
  static const secret = "585e09b9029217294bad";
  static const cluster = "us2";
  static const hostEndPoint = "https://e44c-5-155-31-89.eu.ngrok.io";
  static const hostAuthEndPoint = "$hostEndPoint/api/broadcasting/auth";
  static const port = 6001;
}
