import 'package:MangoBee/screen/user/navbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:MangoBee/screen/user/homepage/app_bar.dart';
import 'package:MangoBee/screen/user/homepage/carousel.dart';
import 'package:MangoBee/screen/user/homepage/category-part.dart';
import 'package:MangoBee/screen/user/homepage/selling_part.dart';
import 'package:MangoBee/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //bottomNavigationBar: NavBar(),
      body: Stack(
        children: [
          Positioned(
            width: MediaQuery.of(context).size.width * 2,
            height: MediaQuery.of(context).size.width * 2,
            child: Transform.translate(
              offset: Offset(MediaQuery.of(context).size.width * -0.5,
                  MediaQuery.of(context).size.width * -1.1),
              child: Icon(
                Icons.circle,
                size: MediaQuery.of(context).size.width * 2,
                color: clrWhite100,
              ),
            ),
          ),
          Container(
            child: ListView(
              children: [
                // appbar/header
                CustomAppBar(),

                // search bar
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  child: TextFormField(
                    // controller: ,

                    decoration: InputDecoration(
                      hintText: "Search Category",
                      hintStyle: myfont(14),
                      contentPadding: EdgeInsets.all(6),
                      prefixIcon: Container(
                        margin: EdgeInsets.only(
                          left: 16,
                          right: 8,
                        ),
                        child: Icon(
                          Icons.search,
                          color: clrPrimary,
                        ),
                      ),
                      filled: true,
                      fillColor: clrWhite000,
                      hoverColor: clrWhite000,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 0,
                        ),
                      ),
                    ),
                  ),
                ),
                // carousel part on carousel.dart
                CarouselPart(),

                // category part
                Categories(),

                // selling part
                Selling(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
