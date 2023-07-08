import 'package:equatable/equatable.dart';

class AuthLoginModel extends Equatable {
  final bool status;

  final String message;

  const AuthLoginModel({
    required this.status,
    required this.message,
  });


  factory AuthLoginModel.fromJson(Map<String, dynamic> jsonData) {
    return AuthLoginModel(
      status: jsonData['status'] as bool,
      message: jsonData['message'] as String,
    );
  }

  @override
  List<Object> get props => [status, message];
}
