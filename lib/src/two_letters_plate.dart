import 'package:brazil_license_plate_drawing/src/brazil_plate_category.dart';
import 'package:flutter/material.dart';

/// A widget that prints a license plate in
///  the "two letters pattern" on the screen.
class TwoLettersPlate extends StatelessWidget {
  /// The letters and numbers drawn in the licence plate
  final String plate;

  /// The city name and state acronym printed in locality header
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
  final BrazilTwoLettersPlateCategory category;

  /// Relation between width and height
  static const double _heightRelation = 215 / 497;

  /// Relation between the width of the left border and the entire plate width.
  static const double _leftBorderRelation = 12 / 497;

  /// Relation between the width of the right border and the entire plate width.
  static const double _rightBorderRelation = 11 / 497;

  /// Relation between the height of top and bottom borders
  /// and the entire plate height.
  static const double _verticalBorderRelation = 11 / 215;

  /// Relation between the width of the locality header container and the entire
  /// plate width.
  static const double _localityContainerWidthRelation = 470 / 497;

  /// Relation between the height of the locality header container and the entire
  /// plate height.
  static const double _localityContainerHeightRelation = 42 / 215;

  /// Relation between the height of the locality header text font and the entire
  /// plate height.
  static const double _localityContainerLettersRelation = 36 / 215;

  /// The relation between the height of the top border of the main letters and
  /// the entire plate height.
  static const double _lettersBorderTop = 0 / 215;

  /// Relation between the height of the letters of the license plate and the entire
  /// license plate height.
  static const double _lettersHeightRelation = 144 / 215;

  // Default plate width if neither width or height values were provided for the
  // class constructor
  static const double _defaultWidth = 300;

  /// The default font family
  static const String _fontFamily = 'Xanh';

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
  const TwoLettersPlate(
    this.plate, {
    this.width,
    this.height,
    this.showLocality = true,
    this.locality = 'BRASIL',
    this.category = BrazilTwoLettersPlateCategory.particular,
  });

  @override
  Widget build(BuildContext context) {
    return _externalWrapper(child: _internalWrapper(child: _charactersContent()));
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
      child: _internalWrapper(child: _charactersContent()),
    );
  }

  /// Draws the inner content wrapper and places the two letter acronym
  /// in the bottom left corner.
  Widget _internalWrapper({required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        color: category.plateColor.backgroundColor,
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
          child: Text(
            locality.toUpperCase(),
            textAlign: TextAlign.center,
            style: TextStyle(
              shadows: [Shadow(color: Colors.black.withOpacity(0.5), blurRadius: 1, offset: Offset(1 * (realWidth / 1000), 1 * (realWidth / 1000)))],
              fontSize: realHeight * _localityContainerLettersRelation,
              fontFamily: _fontFamily,
              package: 'brazil_license_plate_drawing',
              color: category.plateColor.lettersCollor,
            ),
          )),
      SizedBox(
        height: realHeight * _lettersBorderTop,
      )
    ];
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
        height: 1,
        fontSize: fontSize * 1.05,
        fontFamily: _fontFamily,
        package: 'brazil_license_plate_drawing',
        color: category.plateColor.lettersCollor,
        shadows: [
          Shadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 1 * (fontSize / 98),
            offset: Offset(1 * (fontSize / 98), 1 * (fontSize / 98)),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
