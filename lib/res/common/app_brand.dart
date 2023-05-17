import 'package:flutter/material.dart';
import 'package:go_rent_app/res/constant/app_images.dart';

class AppCarBrand extends StatelessWidget {
  final String? brandLogo;
  final String? brandName;
  final String? carCollection;
  const AppCarBrand({
    Key? key,
    this.brandLogo,
    this.brandName,
    this.carCollection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 50,
            width: 66,
            child: Image.asset(brandLogo ?? AppImages.mahindra),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              brandName ?? 'Mahindra',
              style: const TextStyle(
                color: Colors.black,
                fontFamily: 'Mulish',
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Center(
            child: Text(
              carCollection ?? '+32',
              style: const TextStyle(
                fontFamily: "Mulish",
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: Color(0xFF353392),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
