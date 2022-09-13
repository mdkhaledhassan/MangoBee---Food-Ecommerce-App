import 'package:MangoBee/models/auth_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:MangoBee/theme/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Color(0xffF3F5F7), //Color(0xffF3F5F7),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Image.asset(
                            'assets/images/default_user.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // CircleAvatar(
                      //   radius: 30,
                      //   backgroundImage:
                      //       AssetImage('assets/images/default_user.png'),
                      // ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Good Morning',
                            style: GoogleFonts.dmSans(
                                color: Color(0xff979899),
                                fontWeight: FontWeight.w500,
                                fontSize: 12),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Md. Khaled Hassan',
                            style: GoogleFonts.dmSans(
                                color: Color(0xff06161C),
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          )
                        ],
                      )
                    ],
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffffffff), width: 1),
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                        child: IconButton(
                            onPressed: () {
                              setState(() {
                                Auth().signOut(context);
                              });
                            },
                            icon: Icon(Icons.logout_rounded))),
                  )
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
