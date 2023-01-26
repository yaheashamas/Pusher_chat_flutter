class Endpoints {
  static const _apiVersion = "/api";

  ///auth
  static const _baseAuth = "$_apiVersion/auth";
  static const register = "$_baseAuth/register";
  static const login = "$_baseAuth/login";
  static const loginWithToken = "$_baseAuth/login_with_token";
  static const logout = "$_baseAuth/logout";

  ///chat
  static const _baseChat = "$_apiVersion/chat";

  static const getChats = _baseChat;
  static const getSingleChat = "$getChats/";
  static const createChat = _baseChat;

  ///chat Message
  static const _baseChatMessage = "$_apiVersion/chat_message";
  static const getChatMessages = _baseChatMessage;
  static const createChatMessages = _baseChatMessage;

  ///user
  static const getUsers = "$_apiVersion/user";
}
