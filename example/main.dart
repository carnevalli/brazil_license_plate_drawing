import 'package:brazil_license_plate_drawing/brazil_license_plate_drawing.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            const MercosulPlate(
              'AVG0A33',
              width: 300,
              category: BrazilPlateCategory.PARTICULAR,
            ),
            const SizedBox(
              height: 30,
            ),
            const MercosulPlate(
              'AVG0A33',
              width: 300,
              category: BrazilPlateCategory.COMMERCIAL,
            ),
            const SizedBox(
              height: 30,
            ),
            const ThreeLettersPlate(
              'AVG0033',
              width: 300,
              locality: 'PR - CURITIBA',
              showLocality: true,
              category: BrazilPlateCategory.PARTICULAR,
            ),
            const SizedBox(
              height: 30,
            ),
            const ThreeLettersPlate(
              'AVG0033',
              width: 300,
              locality: 'PR - CURITIBA',
              showLocality: true,
              category: BrazilPlateCategory.COMMERCIAL,
            ),
            const SizedBox(
              height: 30,
            ),
            const TwoLettersPlate(
              'AV0033',
              width: 300,
              locality: 'RJ - RIO DE JANEIRO',
              showLocality: true,
              category: BrazilPlateCategory.PARTICULAR,
            ),
            const SizedBox(
              height: 30,
            ),
            const TwoLettersPlate(
              'AV0033',
              width: 300,
              locality: 'RJ - RIO DE JANEIRO',
              showLocality: true,
              category: BrazilPlateCategory.COMMERCIAL,
            ),
            const SizedBox(
              height: 30,
            ),
            const TwoLettersPlate(
              'AV0033',
              width: 300,
              showLocality: false,
              category: BrazilPlateCategory.COMMERCIAL,
            ),
          ],
        ),
      ),
    );
  }
}
