/// Represents a category of a plate type. Each category must have its own
/// color theme representation.
///
import 'package:brazil_license_plate_drawing/src/plate_color_set.dart';
import 'package:flutter/material.dart';

enum BrazilMercosulPlateCategory {
  particular,
  comercial,
  especial,
  oficial,
  diplomatico,
  colecionador,
}

extension BrazilMercosulPlateCategoryEx on BrazilMercosulPlateCategory {
  PlateColorSet get plateColor {
    switch (this) {
      case BrazilMercosulPlateCategory.particular:
        return PlateColorSet(
          backgroundColor: Colors.white,
          borderColor: Colors.black,
          lettersCollor: Colors.black,
        );

      case BrazilMercosulPlateCategory.comercial:
        return PlateColorSet(
          backgroundColor: Colors.white,
          borderColor: Colors.red,
          lettersCollor: Colors.red,
        );

      case BrazilMercosulPlateCategory.especial:
        return PlateColorSet(
          backgroundColor: Colors.white,
          borderColor: Colors.green,
          lettersCollor: Colors.green,
        );

      case BrazilMercosulPlateCategory.oficial:
        return PlateColorSet(
          backgroundColor: Colors.white,
          borderColor: Colors.blue,
          lettersCollor: Colors.blue,
        );

      case BrazilMercosulPlateCategory.diplomatico:
        return PlateColorSet(
          backgroundColor: Colors.white,
          borderColor: Color(0xffdaa520),
          lettersCollor: Color(0xffdaa520),
        );

      case BrazilMercosulPlateCategory.colecionador:
        return PlateColorSet(
          backgroundColor: Colors.white,
          borderColor: Colors.grey,
          lettersCollor: Colors.grey,
        );

      default:
        return PlateColorSet(
          backgroundColor: Colors.white,
          borderColor: Colors.black,
          lettersCollor: Colors.black,
        );
    }
  }
}

enum BrazilThreeLettersPlateCategory {
  particular,
  comercial,
  especial,
  oficial,
  diplomatico,
  colecionador,
  aprendizagem,
  representacao,
}

extension BrazilThreeLettersPlateCategoryEx on BrazilThreeLettersPlateCategory {
  PlateColorSet get plateColor {
    switch (this) {
      case BrazilThreeLettersPlateCategory.particular:
        return PlateColorSet(
          backgroundColor: Colors.grey[400]!,
          borderColor: Colors.grey,
          lettersCollor: Colors.black,
        );

      case BrazilThreeLettersPlateCategory.comercial:
        return PlateColorSet(
          backgroundColor: Colors.red[700]!,
          borderColor: Colors.red[900]!,
          lettersCollor: Colors.white,
        );

      case BrazilThreeLettersPlateCategory.oficial:
        return PlateColorSet(
          backgroundColor: Color(0xFFFFFFFF),
          borderColor: Color(0xFFececec),
          lettersCollor: Colors.black,
        );

      case BrazilThreeLettersPlateCategory.especial:
        return PlateColorSet(
          backgroundColor: Colors.green[700]!,
          borderColor: Colors.green[900]!,
          lettersCollor: Colors.white,
        );

      case BrazilThreeLettersPlateCategory.diplomatico:
        return PlateColorSet(
          backgroundColor: Colors.blue[700]!,
          borderColor: Colors.blue[900]!,
          lettersCollor: Colors.white,
        );

      case BrazilThreeLettersPlateCategory.colecionador:
        return PlateColorSet(
          backgroundColor: Color(0xFF353535),
          borderColor: Color(0xFF242424),
          lettersCollor: Colors.white,
        );

      case BrazilThreeLettersPlateCategory.aprendizagem:
        return PlateColorSet(
          backgroundColor: Color(0xFFFFFFFF),
          borderColor: Color(0xFFececec),
          lettersCollor: Colors.red[700]!,
        );

      case BrazilThreeLettersPlateCategory.representacao:
        return PlateColorSet(
          backgroundColor: Color(0xFF353535),
          borderColor: Color(0xFF242424),
          lettersCollor: Color(0xffdaa520),
        );

      default:
        return PlateColorSet(
          backgroundColor: Colors.grey[400]!,
          borderColor: Colors.grey,
          lettersCollor: Colors.black,
        );
    }
  }
}

enum BrazilTwoLettersPlateCategory {
  particular,
  comercial,
}

extension BrazilTwoLettersPlateCategoryEx on BrazilTwoLettersPlateCategory {
  PlateColorSet get plateColor {
    switch (this) {
      case BrazilTwoLettersPlateCategory.particular:
        return PlateColorSet(
          backgroundColor: Colors.amber,
          borderColor: Colors.amber[600]!,
          lettersCollor: Colors.black,
        );

      case BrazilTwoLettersPlateCategory.comercial:
        return PlateColorSet(
          backgroundColor: Colors.red[800]!,
          borderColor: Colors.red[900]!,
          lettersCollor: Colors.white,
        );

      default:
        return PlateColorSet(
          backgroundColor: Colors.amber,
          borderColor: Colors.amber[600]!,
          lettersCollor: Colors.black,
        );
    }
  }
}
