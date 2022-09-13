import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:MangoBee/theme/theme.dart';

class Selling extends StatelessWidget {
  const Selling({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 24,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Best Selling",
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
                image: AssetImage("assets/images/Fire.png"),
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
            margin: EdgeInsets.only(top: 16),
            height: 220,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 2,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 24,
                        horizontal: 16,
                      ),
                      width: MediaQuery.of(context).size.width * 0.5 - 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: clrWhite100,
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/images/meat-selling.png",
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          Container(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Bell Pepper Red",
                                  style: myfont(
                                    14,
                                    FontWeight.bold,
                                    clrBlack,
                                  ),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "1kg, 4\$",
                                  style: myfont(
                                    16,
                                    FontWeight.bold,
                                    clrSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 12,
                      right: 12,
                      child: SizedBox(
                        width: 40,
                        height: 40,
                        child: FloatingActionButton(
                          onPressed: () {},
                          backgroundColor: clrPrimary,
                          child: Icon(
                            Icons.add,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 12,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
