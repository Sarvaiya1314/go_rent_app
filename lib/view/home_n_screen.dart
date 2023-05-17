import 'package:flutter/material.dart';
import 'package:go_rent_app/data/app_data.dart';

import '../res/common/app_brand.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Image.asset(
                    'assets/image/AppMenu.png',
                    height: 40,
                  ),
                ),
                SizedBox(
                  child: Image.asset(
                    'assets/image/AppProf.png',
                    height: 40,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Hello,',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 20,
                fontFamily: "Mulish",
                fontWeight: FontWeight.w500,
              ),
            ),
            const Text(
              'Adrian',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 20,
                fontFamily: "Mulish",
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Container(
                      height: 52,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: const Color(0xFFE2E2E2),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            child: Image.asset(
                              'assets/image/Search.png',
                              height: 25,
                            ),
                          ),
                          const Text(
                            'search a vehicle',
                            style: TextStyle(
                              color: Color(0xFF666666),
                              fontFamily: 'Mulish',
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Image.asset(
                  'assets/image/AppFilter.png',
                  height: 30,
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 189,
              width: 300,
              decoration: BoxDecoration(
                color: const Color(0x1AB2B2B2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(
                'assets/image/penal.png',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: const [
                Text(
                  'Our Brands',
                  style: TextStyle(
                    fontFamily: 'Mulish',
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Spacer(),
                Text(
                  'See All',
                  style: TextStyle(
                    color: Colors.black87,
                    fontFamily: "Mulish",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 15,
                )
              ],
            ),
            /*SizedBox(
              height: 100,
              width: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: brandList.length,
                itemBuilder: (context, index) => Container(),
              ),
            )*/

            Container(
              height: 119,
              width: 330,
              color: Colors.transparent,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: brandList.length,
                itemBuilder: (context, index) => AppCarBrand(
                  brandLogo: brandList[index].image!,
                  brandName: brandList[index].brandName!,
                  carCollection: brandList[index].carCollection!,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
