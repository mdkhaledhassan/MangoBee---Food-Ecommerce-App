import 'package:MangoBee/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Categories",
                style: myfont(
                  18,
                  FontWeight.w700,
                  clrBlack,
                ),
              ),
              SizedBox(
                width: 4,
              ),
              Image(
                image: AssetImage("assets/images/Face.png"),
                width: 18,
                height: 18,
                fit: BoxFit.cover,
              ),
              Spacer(),
              TextButton(
                onPressed: () {},
                child: Text(
                  "See all",
                  style: myfont(
                    14,
                    FontWeight.w500,
                    clrPrimary,
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 100,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 7,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: clrWhite100,
                      radius: 30,
                      child: Image.asset(
                        "assets/images/apple.png",
                        width: 36,
                        height: 36,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      "Fruits",
                      style: myfont(
                        14,
                        FontWeight.w500,
                        clrBlack,
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 16,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
