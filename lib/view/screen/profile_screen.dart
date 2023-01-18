import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width:double.infinity ,
      height: double.infinity,
      color: Colors.blue,
      child: const Text('profile'),
    );
  }
}
