import 'package:brazil_license_plate_drawing/src/brazil_plate_category.dart';
import 'package:flutter/material.dart';

/// A widget that draws a Mercosul plate on the screen.
class MercosulPlate extends StatelessWidget {
  /// The letters and numbers drawn in the licence plate
  final String plate;

  /// The width that the whole widget will take. If null, the width value
  /// will be infered from the height value. If height is null, then the
  /// _defaultWidth value will be considered.
  final double? width;

  /// The height that the whole widget will take. If left null, then the original
  /// proportion factor will be used to calculate this value from the width.
  final double? height;

  /// The plate's category which determines the default color set
  final BrazilMercosulPlateCategory category;

  /// The string that represents the text which will be positioned at the top
  /// of the licence plate, generally the name of the country.
  /// Always converted to uppercase.
  /// Defaults to "BRASIL"
  final String countryText;

  /// The two letters printed at the bottom left position.
  /// Always converted to uppercase.
  /// Defaults to "BR"
  final String countryAcronymLetters;

  /// The name of the image asset that will be placed in the top right corner.
  /// Considers a relative path from the root of the `assets` folder.
  /// Defaults to `brazil.png`
  final String countryFlagAsset;

  /// The path of the logo asset that will be placed in the top left corner.
  /// Considers a relative path from the root of the `assets` folder.
  /// Defaults to `merco.png`
  final String mercosulLogoAsset;

  // The following constants are the proportion factors from the sizes of a
  // real car license plate.

  /// Relation between width and height
  static const double _heightRelation = 235 / 724;

  /// Relation between the width of the left border and the entire plate width.
  static const double _leftBorderRelation = 15 / 724;

  /// Relation between the width of the right border and the entire plate width.
  static const double _rightBorderRelation = 13 / 724;

  /// Relation between the height of top and bottom borders
  /// and the entire plate height.
  static const double _verticalBorderRelation = 14 / 235;

  /// Relation between the height of the locality header container and the entire
  /// plate height.
  static const double _localityContainerHeightRelation = 55 / 235;

  /// Relation between the height of the locality header text font and the entire
  /// plate height.
  static const double _localityContainerLettersRelation = 28 / 235;

  /// Relation between the height of the letters of the license plate and the entire
  /// license plate height.
  static const double _lettersHeightRelation = 130 / 235;
  // Default plate width if neither width or height values were provided for the
  // class constructor
  static const double _defaultWidth = 300;

  /// Evaluates the width value that will be used to draw the widget.
  /// If a value is passed to the constructor, then this value will be used.
  /// Otherwise, it checks if a value has been passed to height and calculates
  /// the width using the original proportion factor. If both width and height are
  /// nulls, then the value setted for _defaultWidth will be used.
  double get realWidth {
    if (width != null) {
      return width!;
    } else {
      if (height == null) {
        return _defaultWidth;
      } else {
        return height! * 1 / _heightRelation;
      }
    }
  }

  /// Evaluates the real height that will be considered
  /// while drawing the widget.
  /// If a height value was explicitly passed to object's
  /// constructor, then this value will be used.
  /// Otherwise, it infers a value for height from the width property,
  /// consering the original proportional factor.
  double get realHeight {
    if (height != null) {
      return height!;
    } else {
      return realWidth * _heightRelation;
    }
  }

  /// Class constructor. To obtain the original aspect ratio  of a real
  /// license plate, only provide a value for width
  /// OR height, so it will keep the original proportion automatically.
  /// If a value is provided for these two properties, then the original
  /// aspect ratio will not be take in account.
  /// If neither are provided, the value of _defaultWidth will be used.
  const MercosulPlate(
    this.plate, {
    this.width,
    this.height,
    this.category = BrazilMercosulPlateCategory.particular,
    this.countryText = 'BRASIL',
    this.countryAcronymLetters = 'BR',
    this.countryFlagAsset = 'assets/images/brazil.png',
    this.mercosulLogoAsset = 'assets/images/merco.png',
  });

  @override
  Widget build(BuildContext context) {
    return _externalWrapper(
      child: _internalWrapper(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _countryTopBar(),
            _charactersContent(),
          ],
        ),
      ),
    );
  }

  /// Draws the outer borders.
  Widget _externalWrapper({required Widget child}) {
    return Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(15 * (realWidth / 500)),
          color: category.plateColor.borderColor,
        ),
        width: realWidth,
        height: realHeight,
        padding: EdgeInsets.fromLTRB(
          realWidth * _leftBorderRelation,
          realHeight * _verticalBorderRelation,
          realWidth * _rightBorderRelation,
          realHeight * _verticalBorderRelation,
        ),
        child: child);
  }

  /// Draws the inner content wrapper and places the two letter acronym
  /// in the bottom left corner.
  Widget _internalWrapper({required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        color: category.plateColor.backgroundColor,
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: -10 * (realWidth / 1000),
            left: 0,
            child: Text(countryAcronymLetters.toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 50 * (realWidth / 1000),
                )),
          ),
          child,
        ],
      ),
    );
  }

  /// Draws the header which contains the country name and flags.
  Widget _countryTopBar() {
    final double flagBorderRadius = 3 * (realWidth / 500);
    final double flagPadding = 2 * (realWidth / 500);
    return Container(
        width: double.infinity,
        height: realHeight * _localityContainerHeightRelation,
        decoration: BoxDecoration(
          color: Color(0xFF003399),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              left: 5 * (realWidth / 500),
              child: Container(
                color: Colors.transparent,
                height: realHeight * _localityContainerHeightRelation * 0.8,
                child: Image.asset(
                  mercosulLogoAsset,
                  package: 'brazil_license_plate_drawing',
                  color: Color(0xFF003399),
                  colorBlendMode: BlendMode.lighten,
                ),
              ),
            ),
            Text(
              countryText.toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                height: 1.9,
                fontSize: realHeight * _localityContainerLettersRelation,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Positioned(
              right: 5 * (realWidth / 500),
              child: Container(
                height: realHeight * _localityContainerHeightRelation * 0.8,
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(flagBorderRadius),
                  ),
                  child: Image.asset(
                    countryFlagAsset,
                    package: 'brazil_license_plate_drawing',
                    fit: BoxFit.contain,
                  ),
                ),
                padding: EdgeInsets.all(flagPadding),
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(flagBorderRadius),
                ),
              ),
            )
          ],
        ));
  }

  /// Draws the area in which will be printed the main license plate characters.
  Widget _charactersContent() {
    return Container(
      height: realHeight * _lettersHeightRelation,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _getPlateChars(plate, realHeight * _lettersHeightRelation),
        ],
      ),
    );
  }

  /// Styles the main license plate characters
  Text _getPlateChars(String chars, [double fontSize = 40]) {
    return Text(
      chars.toUpperCase(),
      style: TextStyle(
        fontSize: fontSize,
        letterSpacing: 2 * (fontSize / 98),
        fontFamily: 'fe',
        package: 'brazil_license_plate_drawing',
        color: category.plateColor.lettersCollor,
      ),
      textAlign: TextAlign.center,
    );
  }
}
