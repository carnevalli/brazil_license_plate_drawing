# BrazilLicensePlateDrawing

A set of Flutter Widgets which draw on the screen three different types of brazilian cars' license plates:

* Mercosul
* Three Letters (pattern from the 1990's)
* Two Letters (pattern from the 1970's)

## Usage

### Mercosul - Particular/Private Vehicle
![Brazil Mercosul Particular License Plate](https://raw.githubusercontent.com/carnevalli/brazil_license_plate_drawing/main/resources/docs/images/mercosul-particular.png)
```dart
const MercosulPlate(
    'AVG0A33',
    width: 600,
    category: BrazilMercosulPlateCategory.particular,
)
```

### Mercosul / Commercial Vehicle
![Brazil Mercosul Commercial License Plate](https://raw.githubusercontent.com/carnevalli/brazil_license_plate_drawing/main/resources/docs/images/mercosul-commercial.png)
```dart
const MercosulPlate(
    'AVG0A33',
    width: 600,
    category: BrazilMercosulPlateCategory.comercial,
)
```

### Three Letters - Particular/Private Vehicle
![Brazil Three Letters Particular License Plate](https://raw.githubusercontent.com/carnevalli/brazil_license_plate_drawing/main/resources/docs/images/3l-particular.png)
```dart
const ThreeLettersPlate(
    'AVG0033',
    width: 600,
    locality: 'PR - CURITIBA',
    showLocality: true,
    category: BrazilThreeLettersPlateCategory.particular,
)
```

### Three Letters - Commercial Vehicle
![Brazil Three Letters Commercial License Plate](https://raw.githubusercontent.com/carnevalli/brazil_license_plate_drawing/main/resources/docs/images/3l-commercial.png)
```dart
const ThreeLettersPlate(
    'AVG0033',
    width: 600,
    locality: 'PR - CURITIBA',
    showLocality: true,
    category: BrazilThreeLettersPlateCategory.comercial,
)
```

### Two Letters - Particular/Private Vehicle
![Brazil Two Letters Particular License Plate](https://raw.githubusercontent.com/carnevalli/brazil_license_plate_drawing/main/resources/docs/images/2l-particular.png)
```dart
const TwoLettersPlate(
    'AV0033',
    width: 600,
    locality: 'RJ - RIO DE JANEIRO',
    showLocality: true,
    category: BrazilTwoLettersPlateCategory.particular,
)
```

### Two Letters - Commercial
![Brazil Two Letters Commercial License Plate](https://raw.githubusercontent.com/carnevalli/brazil_license_plate_drawing/main/resources/docs/images/2l-commercial.png)
```dart
const TwoLettersPlate(
    'AV0033',
    width: 600,
    locality: 'RJ - RIO DE JANEIRO',
    showLocality: true,
    category: BrazilTwoLettersPlateCategory.comercial,
),
```

### Compact Version
![Brazil Three Letters Particular License Plate](https://raw.githubusercontent.com/carnevalli/brazil_license_plate_drawing/main/resources/docs/images/3l-compact.png)

Without the locality header. Available for ```TwoLettersPlate``` and ```ThreeLettersPlate```.

```dart
const TwoLettersPlate(
    'AV0033',
    width: 600,
    showLocality: false,
    category: BrazilTwoLettersPlateCategory.comercial,
),
```

### Main Parameters
Parameter | Description
---|---
*double* width| The width that the whole widget will take. If null, the width value will be inferred from the height value. If height is null, then the ``_defaultWidthvalue`` property will be considered.
*double* height|The height that the whole widget will take. If left null, then the original proportion factor will be used to calculate this value from the width value.
*BrazilPlateCategory* category|The plate's category which determines the default color set.
*bool* showLocality| *Except for Mercosul*. Whether to show or hide the locality header. Defaults to ```true```.
*String* locality| *Except for Mercosul*. The city name and state acronym printed in locality header. Defaults to ```"BRASIL"```.
*String* countryText|*Mercosul only*.  The string that represents the text which will be positioned at the top of the licence plate, generally the name of the country.    Always converted to uppercase. Defaults to ```"BRASIL"```.
*String* countryAcronymLetters| *Mercosul only*. The two letters printed at the bottom left position. Always converted to uppercase. Defaults to ```"BR"```.
*String* countryFlagAsset| *Mercosul only*. The name of the image asset that will be placed in the top right corner. Considers a relative path from the root of the `assets` folder. Defaults to `brazil.png`
*String* mercosulLogoAsset| *Mercosul only*. The path of the logo asset that will be placed in the top left corner. Considers a relative path from the root of the `assets` folder. Defaults to `merco.png`

### Known Limitations
* These widgets were created to support only the expected number of characters, according to each plate type. Using more than the expected number of characters can lead to unexpected behaviours, like overflows and exceptions.