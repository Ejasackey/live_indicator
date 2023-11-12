<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

# live_indicator
A very simple package to display the live ripple effect.

## Features

![demo_1](assets/live_product.gif) ![demo_1](assets/play_button.gif)


## Getting started

add package to your dependencies

`````` dart
dependencies:
    ...
    live_indicator: <version_number>
``````

## Usage

import `live_indicator.dart`

``````dart
import "package:live_indicator/live_indicator.dart";
``````

add widget directly
```dart
LiveIndicator()
```

Customize indicator
```dart
LiveIndicator(
    color: Colors.red.shade700,
    radius: 2.5,
    spreadRadius: 5,
    spreadDuration: const Duration(seconds: 1),
    waitDuration: const Duration(seconds: 1),
    child: Icon(Icons.favorite)
)
```

#### Don't forget to give a like 👍
