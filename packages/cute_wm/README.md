## Getting started

In your flutter project add the dependency:

```yml
dependencies:
  ...
  flutter_cute: 
```

## Usage example

Import `flutter_cute.dart`

```dart
import 'package:flutter_cute/flutter_cute.dart';
```

### Create Widget

```dart
class CounterPage extends CuteWidget<CounterWM> {
  const CounterPage({
    Key? key,
  }) : super(key: key, wmFactory: CounterWM.factory);

  @override
  Widget build(CounterWM wm) {
    return Scaffold(
      appBar: AppBar(title: Text(wm.pageTitle)),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 16),
            ValueListenableBuilder(
              valueListenable: wm.count,
              builder: (_, count, __) => Text(
                count.toString(),
                style: wm.textTheme.headline4,
              ),
            ),
            ElevatedButton(
              onPressed: wm.increment,
              child: const Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}
```

### Create WidgetModel
```dart
class CounterWM extends WidgetModel {
  CounterWM.factory(BuildContext context);

  TextTheme get textTheme => Theme.of(context).textTheme;

  final count = ValueNotifier<int>(0);
  final pageTitle = 'Flutter cute demo';

  @override
  void init() => count.value = 15;

  void increment() => count.value++;
}
```