import 'package:flutter/material.dart';

class TrashboxScreen extends StatefulWidget {
  const TrashboxScreen({super.key});

  @override
  State<TrashboxScreen> createState() => _TrashboxScreenState();
}

class _TrashboxScreenState extends State<TrashboxScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                height: 44,
                width: 44,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(color: Color(0xffF1F1F5), width: 1)),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black,
                  size: 20,
                ),
              ),
            ),
          ),
          title: Text(
            "Trashbox",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
        ),
      ),
    );
  }
}
