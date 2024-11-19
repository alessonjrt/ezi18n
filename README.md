
# EzI18n

**EzI18n** is a lightweight internationalization (i18n) library for Flutter. It simplifies managing translations and supports dynamic parameter replacement, making multilingual apps easy to develop.

## Features

- Support for generic (`pt`) and specific (`pt_BR`) locales.
- Dynamic parameter replacement (`@{name}`).
- Fallback mechanism for missing translations.
- Seamless integration with Flutter's localization framework.

## Getting Started

### Installation

Add EzI18n to your `pubspec.yaml`:

```yaml
dependencies:
  ezi18n: ^1.0.0
```

Run:

```bash
flutter pub get
```

### Usage

1. **Define translations:**

```dart
import 'package:ezi18n/ezi18n.dart';

class AppMessages implements EzMessages {
  @override
  Map<String, Map<String, String>> get keys => {
    'en': {'greeting': 'Hello, @{name}!'},
    'pt': {'greeting': 'Olá, @{name}!'},
  };
}
```

2. **Set up localization in your app:**

```dart
import 'package:ezi18n/ezi18n.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        EzI18nDelegate(AppMessages()),
      ],
      supportedLocales: [Locale('en'), Locale('pt')],
      home: MyHomePage(),
    );
  }
}
```

3. **Use translations:**

```dart
import 'package:flutter/material.dart';
import 'package:ezi18n/ezi18n.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('greeting'.tr(context, params: {'name': 'Alice'}))),
      body: Center(child: Text('greeting'.tr(context, params: {'name': 'Alice'}))),
    );
  }
}
```

## Contributions

Contributions are welcome! Feel free to open issues or submit PRs on GitHub.

## License

EzI18n is available under the MIT license.
