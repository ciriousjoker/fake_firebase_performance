# Fake Firebase Performance

[![pub package](https://img.shields.io/pub/v/fake_firebase_performance.svg)](https://pub.dartlang.org/packages/fake_firebase_performance)

Fakes to write unit tests for apps using Firebase Performance monitoring. Instantiate a `FakeFirebasePerformance`, then pass it around your project to replace `FirebasePerformance.instance`. This fake acts like `FirebasePerformance` except it will load mocked data instead.

## Usage

### A simple usage example

```dart
import 'package:fake_firebase_performance/fake_firebase_performance.dart';

void main() async {
  final perf = FakeFirebasePerformance();

  perf.isPerformanceCollectionEnabled(); // will return false

  perf.newTrace('test'); // will do nothing
  perf.newHttpMetric("https://example.com/", HttpMethod.Get); // will do nothing
}
```

This `perf` object needs to replace the real `FirebasePerformance.instance` during testing. You can do this for example with [Riverpod](https://pub.dev/packages/riverpod) or by doing something like this:

```dart
await tester.pumpWidget(
  MaterialApp(
    title: 'FirebasePerformance Example',
    home: MyApp(overrideFirebasePerformance: perf),
  ),
);
```

## Missing functionality

- `perf.app` will throw
- `perf.pluginConstants` is empty
- `perf.newTrace()` does nothing
- `perf.newHttpMetric()` does nothing

## Compatibility table

| firebase_performance | fake_firebase_performance |
| -------------------- | ------------------------- |
| >=0.8.0              | 1.0.0                     |

## Features and bugs

Please file feature requests and bugs at the [issue tracker](https://github.com/CiriousJoker/fake_firebase_performance/issues).
