import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width:double.infinity ,
      height: double.infinity,
      color: Colors.red,
      child: Text('cart'),
    );
  }
}
