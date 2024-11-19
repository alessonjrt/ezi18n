
# EzI18n 🌍✨

**EzI18n** is a lightweight internationalization (i18n) library for Flutter. It simplifies managing translations and supports dynamic parameter replacement, making multilingual apps easy to develop. 🚀

## Features 🛠️

- 🌎 Support for generic (`pt`) and specific (`pt_BR`) locales.
- 🔄 Dynamic parameter replacement (`@{name}`).
- 🛡️ Fallback mechanism for missing translations.
- 📦 Seamless integration with Flutter's localization framework.

## Getting Started 🏁

### Installation 📥

Add EzI18n to your `pubspec.yaml`:

```yaml
dependencies:
  ezi18n: ^1.0.0
```

Run:

```bash
flutter pub get
```

### Observation 📝  
For native Widget translation, you will need the `flutter_localizations` package to use the delegates, as shown in the example below.

### Usage 🚀

1. **Define translations:** 🗂️

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

2. **Set up localization in your app:** ⚙️

```dart
import 'package:ezi18n/ezi18n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: Locale('en'),
      localizationsDelegates: [
        EzI18nDelegate(AppMessages()),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [Locale('en'), Locale('pt')],
      home: MyHomePage(),
    );
  }
}
```

3. **Use translations:** 📝

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

## Contributions 🤝

Contributions are welcome! 🎉 Feel free to open issues or submit PRs on [GitHub](https://github.com).

## License 📜

EzI18n is available under the MIT license. 🛡️
