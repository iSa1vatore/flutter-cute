## Getting started

In your flutter project add the dependency:

```yml
dependencies:
  ...
  cute_theme_annotation: any

dev_dependencies:
  ...
  cute_theme: any
  build_runner: any
```

## Usage example

Import `flutter_cute.dart` and add part directive

```dart
import 'package:cute_theme_annotation/cute_theme_annotation.dart';

part 'app_theme.cute.dart';
```

### Create base theme class
```dart
@CuteTheme()
class $AppTheme {
  $AppTheme({
    required Brightness brightness,
    required Color colorBackground,
    required BorderRadius borderRadiusMd,
    required TextStyle textTitleSmall,
    required EdgeInsets paddingMd,
  });
}
```

### Run the code generator
```bash
flutter run build_runner build --delete-conflicting-outputs
```

### Create themes
```dart
class AppThemes {
  static AppTheme get light {
    return AppTheme(
      brightness: Brightness.light,
      colorBackground: Colors.white,
      borderRadiusMd: BorderRadius.circular(8),
      textTitleSmall: TextStyle(fontWeight: FontWeight.w500),
      paddingMd: BorderRadius.circular(8),
    );
  }

  static AppTheme get dark {
    return AppTheme(
      brightness: Brightness.dark,
      colorBackground: Colors.black,
      borderRadiusMd: BorderRadius.circular(8),
      textTitleSmall: TextStyle(fontWeight: FontWeight.w500),
      paddingMd: EdgeInsets.all(8),
    );
  }
}
```

### Add extensions
```dart
@override
Widget build(BuildContext context) {
  return MaterialApp(
    theme: ThemeData(
        brightness: AppThemes.light.brightness, 
        extensions: [AppThemes.light]
    ),
    darkTheme: ThemeData(
        brightness: AppThemes.dark.brightness, 
        extensions: [AppThemes.dark]
    ),
  );
}
```

### And finally use it!
```dart
@override
Widget build(BuildContext context) {
  return DecoratedBox(
    decoration: BoxDecoration(
      color: AppTheme.of(context).colorBackground,
      borderRadius: AppTheme.of(context).borderRadiusMd,
    ),
    child: Padding(
      padding: AppTheme.of(context).paddingMd,
      child: Text("CuteTheme", style: AppTheme.of(context).textTitleSmall),
    ),
  );
}
```

### Example
[Github](https://github.com/iSa1vatore/flutter-cute/tree/main/examples/coffee_3in1)

<img src="https://i.ibb.co/FJ36MCR/cute-theme-demo.gif" alt="CuteTheme Demo" style="width:300px;"/>