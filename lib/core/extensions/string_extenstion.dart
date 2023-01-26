import 'package:chat/core/error/failures.dart';

extension StringHelper on String {
  // static String getChatName(
  //   List<ChatParticiantModel> participents,
  //   UserModel currentUser,
  //   ChatModel? chatModel,
  // ) {
  //   final otherParticipents =
  //       participents.where((el) => el.userId != currentUser.id).toList();
  //   if (chatModel != null && otherParticipents.isNotEmpty) {
  //     return otherParticipents[0].user.username;
  //   } else {
  //     return "N/A";
  //   }
  // }

  String get messageFailure => (this as ServerFailure).error.toString();
}
