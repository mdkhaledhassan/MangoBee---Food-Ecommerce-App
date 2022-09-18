import 'package:flutter/material.dart';

class AdminsScreen extends StatefulWidget {
  const AdminsScreen({super.key});

  @override
  State<AdminsScreen> createState() => _AdminsScreenState();
}

class _AdminsScreenState extends State<AdminsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admins'),
        centerTitle: true,
      ),
    );
  }
}
