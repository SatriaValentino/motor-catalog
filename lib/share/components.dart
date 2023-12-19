import 'package:car_app_ui/screens/card_screen.dart';
import 'package:car_app_ui/screens/logo_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicons/unicons.dart';
import 'dart:math';
import '../model/car_model.dart';
import '../screens/home_screen.dart';

// build custom button navigation bar item's
BottomNavigationBarItem buildCustomBottomNavItem(
        IconData icon, ThemeData themeData, Size size) =>
    BottomNavigationBarItem(
        icon: SizedBox(
          height: size.width * 0.12,
          width: size.width * 0.12,
          child: Container(
            decoration: BoxDecoration(
              color: themeData.primaryColor.withOpacity(0.05),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Icon(
              icon,
            ),
          ),
        ),
        label: "");

// build custom button navigation bar
Widget buildCustomBottomNavBar(int currIndex, Size size, ThemeData themeData) =>
    BottomNavigationBar(
      iconSize: size.width * 0.07,
      elevation: 0,
      selectedLabelStyle: const TextStyle(fontSize: 0),
      unselectedLabelStyle: const TextStyle(fontSize: 0),
      currentIndex: currIndex,
      backgroundColor: const Color(0x00ffffff),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: themeData.brightness == Brightness.dark
          ? Colors.indigoAccent
          : Colors.black,
      unselectedItemColor: const Color(0xff3b22a1),
      onTap: (value) {
        if (value != currIndex) {
          if (value == 1) {
            Get.to(HomePage());
          }
        }
      },
      items: [
        buildCustomBottomNavItem(UniconsLine.bell, themeData, size),
        buildCustomBottomNavItem(UniconsLine.map_marker, themeData, size),
        buildCustomBottomNavItem(UniconsLine.user, themeData, size),
        buildCustomBottomNavItem(UniconsLine.apps, themeData, size),
      ],
    );

// build statbar in card screen
Padding buildStat(IconData icon, String title, String desc, Size size,
        ThemeData themeData) =>
    Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.015),
      child: SizedBox(
        height: size.width * 0.32,
        width: size.width * 0.25,
        child: Container(
          decoration: BoxDecoration(
            color: themeData.cardColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              top: size.width * 0.03,
              left: size.width * 0.03,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(icon,
                    color: themeData.primaryColor, size: size.width * 0.08),
                Padding(
                  padding: EdgeInsets.only(
                    top: size.width * 0.02,
                  ),
                  child: Text(
                    title,
                    style: GoogleFonts.poppins(
                      color: themeData.primaryColor,
                      fontSize: size.width * 0.05,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  desc,
                  style: GoogleFonts.poppins(
                      color: themeData.primaryColor,
                      fontSize: size.width * 0.04,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );

// select button in car screen
Align buildSelectButton(Size size) => Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: size.height * 0.01,
        ),
        child: SizedBox(
          height: size.height * 0.07,
          width: size.width,
          child: InkWell(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Align(
                child: Text(
                  'Select',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    fontSize: size.height * 0.025,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff3b22a1),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );

// text form field in home screen
OutlineInputBorder textFieldBorder() => OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(15.0)),
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.5),
        width: 1.0,
      ),
    );

// build category name & view all
Row buildCategory(String text, size, ThemeData themeData) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: size.height * 0.03,
            left: size.width * 0.05,
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: size.width * 0.055,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: size.height * 0.03,
            right: size.width * 0.05,
          ),
          child: Text(
            'View All',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              color: themeData.primaryColor.withOpacity(0.8),
              fontSize: size.width * 0.04,
            ),
          ),
        ),
      ],
    );

// build item for top brands category (Hyndai, golf, ...)
Padding buildBrandLogo(Widget image, Size size, ThemeData themeData) => Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.03,
      ),
      child: InkWell(
        onTap: () {
          Get.to(LogoPage());
        },
        child: SizedBox(
          height: size.width * 0.18,
          width: size.width * 0.18,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
            child: Center(
              child: image,
            ),
          ),
        ),
      ),
    );

// build top brand card
Column buildTopBrands(Size size, ThemeData themeData) => Column(
      children: [
        buildCategory('Top Brands', size, themeData),
        Padding(
          padding: EdgeInsets.only(top: size.height * 0.015),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildBrandLogo(
                Image.asset(
                  'assets/ducati_logo.png',
                  height: size.width * 0.1,
                  width: size.width * 0.15,
                  fit: BoxFit.fill,
                ),
                size,
                themeData,
              ),
              buildBrandLogo(
                Image.asset(
                  'assets/kawasaki_logo.png',
                  height: size.width * 0.12,
                  width: size.width * 0.12,
                  fit: BoxFit.fill,
                ),
                size,
                themeData,
              ),
              buildBrandLogo(
                Image.asset(
                  'assets/suzuki_logo.png',
                  height: size.width * 0.08,
                  width: size.width * 0.12,
                  fit: BoxFit.fill,
                ),
                size,
                themeData,
              ),
              buildBrandLogo(
                Image.asset(
                  'assets/yamaha_logo.png',
                  height: size.width * 0.12,
                  width: size.width * 0.12,
                  fit: BoxFit.fill,
                ),
                size,
                themeData,
              ),
            ],
          ),
        ),
      ],
    );

// build most rented item
Padding buildMostBuyCard(int i, Size size, ThemeData themeData) {
  return Padding(
    padding: EdgeInsets.only(
      right: size.width * 0.03,
    ),
    child: Center(
      child: SizedBox(
        height: size.width * 0.55,
        width: size.width * 0.5,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: const BorderRadius.all(
              Radius.circular(
                20,
              ),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              left: size.width * 0.02,
            ),
            child: InkWell(
              onTap: () {
                Get.to(CardPage(
                  Image: Motorcycle[i]['Image'],
                  Name: Motorcycle[i]['Name'],
                  Power: Motorcycle[i]['Power'],
                  people: Motorcycle[i]['people'],
                  bags: Motorcycle[i]['bags'],
                  Price: Motorcycle[i]['Price'],
                  Rating: Motorcycle[i]['Rating'],
                  isRotated: Motorcycle[i]['isRotated'],
                ));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: size.height * 0.01,
                    ),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Motorcycle[i]['isRotated']
                          ? Image.asset(
                              Motorcycle[i]['Image'],
                              height: size.width * 0.25,
                              width: size.width * 0.5,
                              fit: BoxFit.contain,
                            )
                          : Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.rotationY(pi),
                              child: Image.asset(
                                Motorcycle[i]['Image'],
                                height: size.width * 0.25,
                                width: size.width * 0.5,
                                fit: BoxFit.contain,
                              ),
                            ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: size.height * 0.01,
                    ),
                    child: Text(
                      Motorcycle[i]['Class'] ?? '',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: Colors.black87,
                        fontSize: size.width * 0.05,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    Motorcycle[i]['Name'],
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Colors.black38,
                      fontSize: size.width * 0.03,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Rp ${Motorcycle[i]['Price']}',
                        style: GoogleFonts.poppins(
                          color: themeData.primaryColor.withOpacity(0.8),
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // Text(
                      //   '/per day',
                      //   style: GoogleFonts.poppins(
                      //     color: themeData.primaryColor.withOpacity(0.8),
                      //     fontSize: size.width * 0.03,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
                      const Spacer(),
                      Padding(
                        padding: EdgeInsets.only(
                          right: size.width * 0.025,
                        ),
                        child: SizedBox(
                          height: size.width * 0.1,
                          width: size.width * 0.1,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Color(0xff3b22a1),
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  10,
                                ),
                              ),
                            ),
                            child: const Icon(
                              UniconsLine.credit_card,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

// build most rented card
Widget buildMostBuy(Size size, ThemeData themeData) => Column(
      children: [
        buildCategory('Most Buy', size, themeData),
        Padding(
          padding: EdgeInsets.only(
            top: size.height * 0.015,
            left: size.width * 0.03,
            right: size.width * 0.03,
          ),
          child: SizedBox(
            height: size.width * 0.55,
            width: Motorcycle.length * size.width * 0.5 * 1.03,
            child: ListView.builder(
              primary: false,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: Motorcycle.length,
              itemBuilder: (context, i) {
                return buildMostBuyCard(i, size, themeData);
              },
            ),
          ),
        ),
      ],
    );
