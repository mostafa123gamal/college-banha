class Users {
  String? docId;

  String email;

  Users(
      {
        this.docId ,
        required this.email,
       });
  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      docId: json['docId'],
      email: json['email'],

    );
  }
  Map<String, dynamic> toJson() => {
    'docId': docId,
    'email': email,

  };
}
