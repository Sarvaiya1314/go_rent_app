import 'package:flutter/material.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: const [
                BackButton(),
                Text(
                  'Admin Page',
                  style: TextStyle(color: Colors.black87, fontFamily: "Mulish", fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
