import 'package:brazil_license_plate_drawing/brazil_license_plate_drawing.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(HomeApp());
}

class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: true,
      left: true,
      right: true,
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: const [
              SizedBox(
                height: 30,
              ),
              Text(
                'Mercosul License Plate',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              MercosulPlate(
                'AVG0A33',
                width: 300,
                category: BrazilMercosulPlateCategory.particular,
              ),
              SizedBox(
                height: 30,
              ),
              MercosulPlate(
                'AVG0A33',
                width: 300,
                category: BrazilMercosulPlateCategory.comercial,
              ),
              SizedBox(
                height: 30,
              ),
              MercosulPlate(
                'AVG0A33',
                width: 300,
                category: BrazilMercosulPlateCategory.especial,
              ),
              SizedBox(
                height: 30,
              ),
              MercosulPlate(
                'AVG0A33',
                width: 300,
                category: BrazilMercosulPlateCategory.oficial,
              ),
              SizedBox(
                height: 30,
              ),
              MercosulPlate(
                'AVG0A33',
                width: 300,
                category: BrazilMercosulPlateCategory.diplomatico,
              ),
              SizedBox(
                height: 30,
              ),
              MercosulPlate(
                'AVG0A33',
                width: 300,
                category: BrazilMercosulPlateCategory.colecionador,
              ),
              SizedBox(
                height: 30,
              ),

              ////////////////////////////////////////////////////////////////////////////////
              Text(
                'Three License Plate',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ThreeLettersPlate(
                'AVG0033',
                width: 300,
                locality: 'PR - CURITIBA',
                showLocality: true,
                category: BrazilThreeLettersPlateCategory.particular,
              ),
              SizedBox(
                height: 30,
              ),
              ThreeLettersPlate(
                'AVG0033',
                width: 300,
                locality: 'PR - CURITIBA',
                showLocality: true,
                category: BrazilThreeLettersPlateCategory.comercial,
              ),

              SizedBox(
                height: 30,
              ),
              ThreeLettersPlate(
                'AVG0033',
                width: 300,
                locality: 'PR - CURITIBA',
                showLocality: true,
                category: BrazilThreeLettersPlateCategory.oficial,
              ),

              SizedBox(
                height: 30,
              ),
              ThreeLettersPlate(
                'AVG0033',
                width: 300,
                locality: 'PR - CURITIBA',
                showLocality: true,
                category: BrazilThreeLettersPlateCategory.especial,
              ),

              SizedBox(
                height: 30,
              ),
              ThreeLettersPlate(
                'AVG0033',
                width: 300,
                locality: 'PR - CURITIBA',
                showLocality: true,
                category: BrazilThreeLettersPlateCategory.diplomatico,
              ),

              SizedBox(
                height: 30,
              ),
              ThreeLettersPlate(
                'AVG0033',
                width: 300,
                locality: 'PR - CURITIBA',
                showLocality: true,
                category: BrazilThreeLettersPlateCategory.colecionador,
              ),

              SizedBox(
                height: 30,
              ),
              ThreeLettersPlate(
                'AVG0033',
                width: 300,
                locality: 'PR - CURITIBA',
                showLocality: true,
                category: BrazilThreeLettersPlateCategory.representacao,
              ),

              SizedBox(
                height: 30,
              ),
              ThreeLettersPlate(
                'AVG0033',
                width: 300,
                locality: 'PR - CURITIBA',
                showLocality: true,
                category: BrazilThreeLettersPlateCategory.aprendizagem,
              ),
              SizedBox(
                height: 30,
              ),

              ////////////////////////////////////////////////////////////////////////////////
              Text(
                'Two Letters License Plate',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TwoLettersPlate(
                'AV0033',
                width: 300,
                locality: 'RJ - RIO DE JANEIRO',
                showLocality: true,
                category: BrazilTwoLettersPlateCategory.particular,
              ),
              SizedBox(
                height: 30,
              ),
              TwoLettersPlate(
                'AV0033',
                width: 300,
                locality: 'RJ - RIO DE JANEIRO',
                showLocality: true,
                category: BrazilTwoLettersPlateCategory.comercial,
              ),
              SizedBox(
                height: 30,
              ),
              TwoLettersPlate(
                'AV0033',
                width: 300,
                showLocality: false,
                category: BrazilTwoLettersPlateCategory.comercial,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
