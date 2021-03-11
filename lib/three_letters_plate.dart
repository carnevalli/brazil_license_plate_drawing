import 'package:brazil_license_plate_drawing/brazil_plate_category.dart';
import 'package:brazil_license_plate_drawing/plate_color_set.dart';
import 'package:flutter/material.dart';

class ThreeLettersPlate extends StatelessWidget {
  /// The letters and numbers drawn in the licence plate
  final String plate;
  // The city name and state acronym printed in locality header
  final String locality;

  /// The width that the whole widget will take. If null, the width value
  /// will be infered from the height value. If height is null, then the
  /// _defaultWidth value will be considered.
  final double? width;

  /// The height that the whole widget will take. If left null, then the original
  /// proportion factor will be used to calculate this value from the width.
  final double? height;

  /// Whether to show the locality header
  final bool showLocality;

  /// The plate's category which determines the default color set
  final BrazilPlateCategory category;

  /// Relation between width and height
  static const double _heightRelation = 400 / 1231;

  /// Relation between the width of the left border and the entire plate width.
  static const double _leftBorderRelation = 28 / 1231;

  /// Relation between the width of the right border and the entire plate width.
  static const double _rightBorderRelation = 20 / 1231;

  /// Relation between the height of top and bottom borders
  /// and the entire plate height.
  static const double _verticalBorderRelation = 20 / 400;

  /// Relation between the width of the locality header container and the entire
  /// plate width.
  static const double _localityContainerWidthRelation = 974 / 1231;

  /// Relation between the height of the locality header container and the entire
  /// plate height.
  static const double _localityContainerHeightRelation = 77 / 400;

  /// Relation between the height of the locality header text font and the entire
  /// plate height.
  static const double _localityContainerLettersRelation = 50 / 400;

  /// The relation between the height of the top border of the main letters and
  /// the entire plate height.
  static const double _lettersBorderTop = 15 / 400;

  /// Relation between the height of the letters of the license plate and the entire
  /// license plate height.
  static const double _lettersHeightRelation = 220 / 400;

  /// The relation between the interpunct height and the height of the entire plate.
  static const double _dotHeightRelation = 32 / 400;

  /// Default plate width if neither width or height values were provided for the
  /// class constructor
  static const double _defaultWidth = 300;

  /// Default font family
  static const String _fontFamily = 'Mandatory';

  /// Default color sets
  static final Map<BrazilPlateCategory, PlateColorSet> _colorSets = {
    BrazilPlateCategory.COMMERCIAL: PlateColorSet(
        backgroundColor: Colors.red[700]!,
        borderColor: Colors.red[900]!,
        lettersCollor: Colors.white),
    BrazilPlateCategory.PARTICULAR: PlateColorSet(
        backgroundColor: Colors.grey[400]!,
        borderColor: Colors.grey,
        lettersCollor: Colors.black),
  };

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
  const ThreeLettersPlate(this.plate,
      {this.width,
      this.height,
      this.showLocality = true,
      this.locality = 'BRASIL',
      this.category = BrazilPlateCategory.PARTICULAR});

  @override
  Widget build(BuildContext context) {
    return _externalWrapper(
        child: _internalWrapper(child: _charactersContent()));
  }

  /// Draws the outer borders.
  Widget _externalWrapper({required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5 * (realWidth / 300),
            blurRadius: 7 * (realWidth / 300),
            offset: Offset(0, 3 * (realWidth / 300)),
          ),
        ],
        borderRadius: BorderRadius.circular(15 * (realWidth / 500)),
        color: _colorSets[category]?.borderColor,
      ),
      width: realWidth,
      height: realHeight,
      padding: EdgeInsets.fromLTRB(
          realWidth * _leftBorderRelation,
          realHeight * _verticalBorderRelation,
          realWidth * _rightBorderRelation,
          realHeight * _verticalBorderRelation),
      child: _internalWrapper(child: _charactersContent()),
    );
  }

  /// Draws the inner content wrapper and places the two letter acronym
  /// in the bottom left corner.
  Widget _internalWrapper({required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        color: _colorSets[category]?.backgroundColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [if (showLocality) ..._countryTopBar(), child],
      ),
    );
  }

  /// Draws the header which contains the country name and flags.
  List<Widget> _countryTopBar() {
    return [
      SizedBox(
        height: 10 * (realWidth / 1000),
      ),
      Container(
          width: realWidth * _localityContainerWidthRelation,
          height: realHeight * _localityContainerHeightRelation,
          decoration: BoxDecoration(border: Border.all()),
          child: Text(
            locality.toUpperCase(),
            textAlign: TextAlign.center,
            style: TextStyle(
                height: 1.4,
                shadows: [
                  Shadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 2 * (realWidth / 1000),
                      offset: Offset(
                          2 * (realWidth / 1000), 2 * (realWidth / 1000)))
                ],
                fontSize: realHeight * _localityContainerLettersRelation,
                fontFamily: _fontFamily,
                color: _colorSets[category]?.lettersCollor),
          )),
      SizedBox(
        height: realHeight * _lettersBorderTop,
      )
    ];
  }

  /// Draws the area in which will be printed the main license plate characters.
  Widget _charactersContent() {
    final String letters = plate.substring(0, 3);
    final String numbers = plate.substring(3, 7);
    return Container(
      height: realHeight * _lettersHeightRelation,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _getPlateChars(letters, realHeight * _lettersHeightRelation),
          SizedBox(
            width: 4 * (realWidth / 500),
          ),
          FittedBox(
            child: Container(
              width: realHeight * _dotHeightRelation,
              height: realHeight * _dotHeightRelation,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black,
                      blurRadius: 2 * (realWidth / 1000),
                      offset: Offset(
                          2 * (realWidth / 1000), 2 * (realWidth / 1000)))
                ],
                borderRadius: BorderRadius.circular(5 * (realWidth / 1000)),
                color: _colorSets[category]?.lettersCollor,
              ),
            ),
          ),
          SizedBox(
            width: 4 * (realWidth / 500),
          ),
          _getPlateChars(numbers, realHeight * _lettersHeightRelation),
        ],
      ),
    );
  }

  /// Styles the main license plate characters
  Text _getPlateChars(String chars, [double fontSize = 40]) {
    return Text(
      chars.toUpperCase(),
      style: TextStyle(
          height: 1.03,
          fontSize: fontSize * 1.1,
          letterSpacing: 4 * (fontSize / 98),
          fontFamily: _fontFamily,
          color: _colorSets[category]?.lettersCollor,
          shadows: [
            Shadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 2 * (fontSize / 98),
                offset: Offset(2 * (fontSize / 98), 2 * (fontSize / 98)))
          ]),
      textAlign: TextAlign.center,
    );
  }
}
