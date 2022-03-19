import 'package:flutter/material.dart';

class DetailWalletScreen extends StatefulWidget {
  const DetailWalletScreen({Key? key}) : super(key: key);

  @override
  State<DetailWalletScreen> createState() => _DetailWalletScreenState();
}

class _DetailWalletScreenState extends State<DetailWalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
      ),
    );
  }
}
