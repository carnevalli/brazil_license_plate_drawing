import 'package:flutter/material.dart';

class MercosulPlate extends StatelessWidget {
  final String plate;
  final double width;
  final double height;
  static const double _heightRelation = 235 / 724;
  static const double _leftBorderRelation = 15 / 724;
  static const double _rightBorderRelation = 13 / 724;
  static const double _verticalBorderRelation = 14 / 235;
  static const double _localityContainerHeightRelation = 55 / 235;
  static const double _localityContainerLettersRelation = 28 / 235;
  static const double _lettersHeightRelation = 124 / 235;

  MercosulPlate(this.plate, [this.width = 300])
      : height = _heightRelation * width;

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

  Widget _externalWrapper({required Widget child}) {
    return Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(15 * (width / 500)),
          color: Colors.black,
        ),
        width: width,
        height: height,
        padding: EdgeInsets.fromLTRB(
            width * _leftBorderRelation,
            height * _verticalBorderRelation,
            width * _rightBorderRelation,
            height * _verticalBorderRelation),
        child: child);
  }

  Widget _internalWrapper({required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: -10 * (width / 1000),
            left: 0,
            child: Text('BR',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 60 * (width / 1000),
                )),
          ),
          child,
        ],
      ),
    );
  }

  Widget _countryTopBar() {
    final double flagBorderRadius = 3 * (width / 500);
    final double flagPadding = 2 * (width / 500);
    return Container(
        width: double.infinity,
        height: height * _localityContainerHeightRelation,
        decoration: BoxDecoration(
          color: Color(0xFF003399),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              left: 5 * (width / 500),
              child: Container(
                color: Colors.transparent,
                height: height * _localityContainerHeightRelation * 0.8,
                child: Image.asset('merco.png',
                    color: Color(0xFF003399),
                    colorBlendMode: BlendMode.lighten),
              ),
            ),
            Text(
              'BRASIL',
              textAlign: TextAlign.center,
              style: TextStyle(
                  height: 1.9,
                  fontSize: height * _localityContainerLettersRelation,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Positioned(
              right: 5 * (width / 500),
              child: Container(
                height: height * _localityContainerHeightRelation * 0.8,
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(flagBorderRadius),
                  ),
                  child: Image.asset(
                    'brazil.png',
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

  Widget _charactersContent() {
    final String letters = plate.substring(0, 3);
    final String numbers = plate.substring(3, 7);
    return Container(
      height: height * _lettersHeightRelation,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _getPlateChars(letters, height * _lettersHeightRelation),
          _getPlateChars(numbers, height * _lettersHeightRelation),
        ],
      ),
    );
  }

  Text _getPlateChars(String chars, [double fontSize = 40]) {
    return Text(
      chars.toUpperCase(),
      style: TextStyle(
        fontSize: fontSize,
        letterSpacing: 4 * (fontSize / 98),
        fontFamily: 'fe',
        color: Colors.black,
      ),
      textAlign: TextAlign.center,
    );
  }
}
