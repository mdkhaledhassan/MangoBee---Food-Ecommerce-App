import 'package:flutter/material.dart';

class TrashboxScreen extends StatefulWidget {
  const TrashboxScreen({super.key});

  @override
  State<TrashboxScreen> createState() => _TrashboxScreenState();
}

class _TrashboxScreenState extends State<TrashboxScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TrashBox'),
        centerTitle: true,
      ),
    );
  }
}
