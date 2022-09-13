import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:MangoBee/theme/theme.dart';

class CarouselPart extends StatelessWidget {
  const CarouselPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20,
      ),
      child: CarouselSlider(
        options: CarouselOptions(
          height: 160,
          autoPlay: true,
          enableInfiniteScroll: true,
          pauseAutoPlayOnTouch: true,
        ),
        items: [1, 2, 3].map((e) {
          return Builder(builder: (BuildContext context) {
            return Container(
              clipBehavior: Clip.hardEdge,
              width: MediaQuery.of(context).size.width * 1,
              margin: EdgeInsets.symmetric(
                horizontal: 4,
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/carousel-1.png"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(16),
                // border: Border.all(
                //   width: 1,
                //   color: clrGrey,
                // ),
              ),
              child: Row(
                children: [
                  Spacer(),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: Stack(
                      children: [
                        Positioned(
                          width: 800,
                          height: 800,
                          left: 0,
                          top: -320,
                          child: Container(
                            width: 800,
                            height: 800,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(800),
                              color: clrPrimary,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 24,
                            horizontal: 24,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Ramadan Offers",
                                style: myfont(
                                  12,
                                  FontWeight.w500,
                                  clrWhite000,
                                ),
                              ),
                              Text(
                                "Get 25%",
                                style: myfont(
                                  28,
                                  FontWeight.w500,
                                  clrWhite000,
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                    clrWhite000,
                                  ),
                                ),
                                child: Text(
                                  "Grab Offers",
                                  style: TextStyle(
                                    color: clrPrimary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          });
        }).toList(),
      ),
    );
  }
}
