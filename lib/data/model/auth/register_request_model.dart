import 'package:equatable/equatable.dart';

class RegisterRequestModel extends Equatable {
  final String name;

  final String email;

  final String password;

  final String phone;

  const RegisterRequestModel({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
    };
  }

  @override
  List<Object> get props => [name, email, password, phone];
}
