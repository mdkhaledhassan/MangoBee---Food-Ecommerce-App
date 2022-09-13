import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:MangoBee/theme/theme.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 24,
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            alignment: Alignment.bottomCenter,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Color(0xffDEDEE8),
            ),
            child: Image.asset(
              "assets/images/avatar.png",
              width: 36,
              height: 36,
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Good morning",
                style: myfont(
                  12,
                  FontWeight.w500,
                  clrGrey,
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                "Amelia Barlow",
                style: myfont(
                  16,
                  FontWeight.w500,
                  clrBlack,
                ),
              ),
            ],
          ),
          Spacer(),
          InkWell(
            onTap: () {},
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                CircleAvatar(
                  backgroundColor: clrPrimary,
                  radius: 20,
                  child: Icon(
                    Icons.shopping_basket_rounded,
                    size: 20,
                    color: clrWhite000,
                  ),
                ),
                Positioned(
                  right: -3,
                  top: -3,
                  child: CircleAvatar(
                    radius: 9,
                    backgroundColor: clrSecondary,
                    child: Text(
                      "4",
                      style: myfont(
                        14,
                        FontWeight.w500,
                        clrWhite100,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
