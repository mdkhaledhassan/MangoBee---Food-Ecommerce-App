import 'package:MangoBee/models/auth_model.dart';
import 'package:MangoBee/screen/admin/admins_screen.dart';
import 'package:MangoBee/screen/admin/category_screen.dart';
import 'package:MangoBee/screen/admin/orders_screen.dart';
import 'package:MangoBee/screen/admin/products_screen.dart';
import 'package:MangoBee/screen/admin/trashbox_screen.dart';
import 'package:MangoBee/screen/admin/users_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:MangoBee/theme/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  getProfileInfo() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var u_id = sharedPreferences.getString("u_id");
  }

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
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AdminsScreen()));
                      },
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            color: Color(0xfff14269),
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.people),
                            SizedBox(
                              height: 5,
                            ),
                            Text('Admins'),
                            SizedBox(
                              height: 5,
                            ),
                            Text('0')
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => UsersScreen()));
                      },
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            color: Color(0xff4ee4e2),
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.people),
                            SizedBox(
                              height: 5,
                            ),
                            Text('Users'),
                            SizedBox(
                              height: 5,
                            ),
                            Text('0')
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProductsScreen()));
                      },
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            color: Color(0xff4f49dd),
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.category),
                            SizedBox(
                              height: 5,
                            ),
                            Text('Products'),
                            SizedBox(
                              height: 5,
                            ),
                            Text('0')
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CategoryScreen()));
                      },
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            color: Color(0xfff4893b),
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.category),
                            SizedBox(
                              height: 5,
                            ),
                            Text('Categories'),
                            SizedBox(
                              height: 5,
                            ),
                            Text('0')
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => OrdersScreen()));
                      },
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            color: Color(0xffff8da4),
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.people),
                            SizedBox(
                              height: 5,
                            ),
                            Text('Orders'),
                            SizedBox(
                              height: 5,
                            ),
                            Text('0')
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => TrashboxScreen()));
                      },
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            color: Color(0xfff8ed6d),
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.people),
                            SizedBox(
                              height: 5,
                            ),
                            Text('Trashbox'),
                            SizedBox(
                              height: 5,
                            ),
                            Text('0')
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
