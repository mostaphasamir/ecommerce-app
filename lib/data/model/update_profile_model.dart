class UpdateProfileModel {
  UpdateProfileModel({
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
    required this.image,
  });

  final String name;
  final String phone;
  final String email;
  final String password;
  final String image;

  factory UpdateProfileModel.fromJson(Map<String, dynamic> json) => UpdateProfileModel(
    name: json["name"],
    phone: json["phone"],
    email: json["email"],
    password: json["password"],
    image: json["image"],
  );

   Map<String, dynamic> toJson() => {
    "name": name,
    "phone": phone,
    "email": email,
    "password": password,
    "image": image,
  };
}
