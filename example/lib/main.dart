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
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                category: BrazilMercosulPlateCategory.particular,
              ),
              SizedBox(
                height: 5,
              ),
              Text("Particular"),
              SizedBox(
                height: 30,
              ),
              MercosulPlate(
                'AVG0A33',
                category: BrazilMercosulPlateCategory.comercial,
              ),
              SizedBox(
                height: 5,
              ),
              Text("Comercial"),
              SizedBox(
                height: 30,
              ),
              MercosulPlate(
                'AVG0A33',
                category: BrazilMercosulPlateCategory.especial,
              ),
              SizedBox(
                height: 5,
              ),
              Text("Especial"),
              SizedBox(
                height: 30,
              ),
              MercosulPlate(
                'AVG0A33',
                category: BrazilMercosulPlateCategory.oficial,
              ),
              SizedBox(
                height: 5,
              ),
              Text("Oficial"),
              SizedBox(
                height: 30,
              ),
              MercosulPlate(
                'AVG0A33',
                category: BrazilMercosulPlateCategory.diplomatico,
              ),
              SizedBox(
                height: 5,
              ),
              Text("Diplomático"),
              SizedBox(
                height: 30,
              ),
              MercosulPlate(
                'AVG0A33',
                category: BrazilMercosulPlateCategory.colecionador,
              ),
              SizedBox(
                height: 5,
              ),
              Text("Colecionado"),
              SizedBox(
                height: 30,
              ),

              ////////////////////////////////////////////////////////////////////////////////
              Text(
                'Three Letters License Plate',
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
                locality: 'PR - CURITIBA',
                showLocality: true,
                category: BrazilThreeLettersPlateCategory.particular,
              ),
              SizedBox(
                height: 5,
              ),
              Text("Particular"),
              SizedBox(
                height: 30,
              ),
              ThreeLettersPlate(
                'AVG0033',
                locality: 'PR - CURITIBA',
                showLocality: true,
                category: BrazilThreeLettersPlateCategory.comercial,
              ),
              SizedBox(
                height: 5,
              ),
              Text("Comercial"),

              SizedBox(
                height: 30,
              ),
              ThreeLettersPlate(
                'AVG0033',
                locality: 'PR - CURITIBA',
                showLocality: true,
                category: BrazilThreeLettersPlateCategory.oficial,
              ),

              SizedBox(
                height: 5,
              ),
              Text("Oficial"),

              SizedBox(
                height: 30,
              ),
              ThreeLettersPlate(
                'AVG0033',
                locality: 'PR - CURITIBA',
                showLocality: true,
                category: BrazilThreeLettersPlateCategory.especial,
              ),

              SizedBox(
                height: 5,
              ),
              Text("Especial"),

              SizedBox(
                height: 30,
              ),
              ThreeLettersPlate(
                'AVG0033',
                locality: 'PR - CURITIBA',
                showLocality: true,
                category: BrazilThreeLettersPlateCategory.diplomatico,
              ),

              SizedBox(
                height: 5,
              ),
              Text("Diplomático"),

              SizedBox(
                height: 30,
              ),
              ThreeLettersPlate(
                'AVG0033',
                locality: 'PR - CURITIBA',
                showLocality: true,
                category: BrazilThreeLettersPlateCategory.colecionador,
              ),

              SizedBox(
                height: 5,
              ),
              Text("Colecionador"),

              SizedBox(
                height: 30,
              ),
              ThreeLettersPlate(
                'AVG0033',
                locality: 'PR - CURITIBA',
                showLocality: true,
                category: BrazilThreeLettersPlateCategory.representacao,
              ),

              SizedBox(
                height: 5,
              ),
              Text("Representação"),

              SizedBox(
                height: 30,
              ),
              ThreeLettersPlate(
                'AVG0033',
                locality: 'PR - CURITIBA',
                showLocality: true,
                category: BrazilThreeLettersPlateCategory.aprendizagem,
              ),

              SizedBox(
                height: 5,
              ),
              Text("Aprendizagem"),

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
                locality: 'RJ - RIO DE JANEIRO',
                showLocality: true,
                category: BrazilTwoLettersPlateCategory.particular,
              ),

              SizedBox(
                height: 5,
              ),
              Text("Particular"),

              SizedBox(
                height: 30,
              ),
              TwoLettersPlate(
                'AV0033',
                locality: 'RJ - RIO DE JANEIRO',
                showLocality: true,
                category: BrazilTwoLettersPlateCategory.comercial,
              ),

              SizedBox(
                height: 5,
              ),
              Text("Comercial"),

              SizedBox(
                height: 30,
              ),
              TwoLettersPlate(
                'AV0033',
                showLocality: false,
                category: BrazilTwoLettersPlateCategory.comercial,
              ),

              SizedBox(
                height: 5,
              ),
              Text("Comercial"),
            ],
          ),
        ),
      ),
    );
  }
}
