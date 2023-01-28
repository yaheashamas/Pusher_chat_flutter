class ChatRequest {
  final int user_id;
  final int? is_private;
  final String? name;

  ChatRequest(
    this.user_id, {
    this.is_private = 1,
    this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'user_id': user_id,
      'is_private': is_private,
      'name': name,
    };
  }

  factory ChatRequest.fromMap(Map<String, dynamic> map) {
    return ChatRequest(
      map['user_id'],
      is_private: map['is_private'],
      name: map['name'],
    );
  }
}
