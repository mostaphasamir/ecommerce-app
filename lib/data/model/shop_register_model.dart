class RegisterModel {
  RegisterModel({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool status;
  final String message;
  final Data ? data;

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
    status: json["status"],
    message: json["message"],
    data:json["data"]!=null?Data.fromJson(json["data"]):null,
  );
}

class Data {
  Data({
    required this.name,
    required this.phone,
    required this.email,
    required this.id,
    required this.image,
    required this.token,
  });

  final String name;
  final String phone;
  final String email;
  final int id;
  final String image;
  final String token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"],
    phone: json["phone"],
    email: json["email"],
    id: json["id"],
    image: json["image"],
    token: json["token"],
  );
}