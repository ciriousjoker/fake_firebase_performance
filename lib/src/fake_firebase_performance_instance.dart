library fake_firebase_performance;

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:flutter/foundation.dart';

/// Fake implementation of [FirebasePerformance] for testing.
class FakeFirebasePerformance
    with ChangeNotifier
    implements FirebasePerformance {
  @override
  late FirebaseApp app;

  @override
  Future<bool> isPerformanceCollectionEnabled() {
    return Future.value(false);
  }

  @override
  HttpMetric newHttpMetric(String url, HttpMethod httpMethod) {
    return FakeHttpMetric();
  }

  @override
  Trace newTrace(String name) {
    return FakeTrace();
  }

  @override
  Map get pluginConstants => {};

  @override
  Future<void> setPerformanceCollectionEnabled(bool enabled) {
    return Future.value();
  }
}

class FakeHttpMetric implements HttpMetric {
  @override
  int? httpResponseCode;

  @override
  int? requestPayloadSize;

  @override
  String? responseContentType;

  @override
  int? responsePayloadSize;

  @override
  String? getAttribute(String name) => null;

  @override
  Map<String, String> getAttributes() => {};

  @override
  void putAttribute(String name, String value) {
    // noop
  }

  @override
  void removeAttribute(String name) {
    // noop
  }

  @override
  Future<void> start() {
    return Future.value();
  }

  @override
  Future<void> stop() {
    return Future.value();
  }
}

class FakeTrace implements Trace {
  @override
  String? getAttribute(String name) => null;

  @override
  Map<String, String> getAttributes() => {};

  @override
  int getMetric(String name) => 0;

  @override
  void incrementMetric(String name, int value) {
    // noop
  }

  @override
  void putAttribute(String name, String value) {
    // noop
  }

  @override
  void removeAttribute(String name) {
    // noop
  }

  @override
  void setMetric(String name, int value) {
    // noop
  }

  @override
  Future<void> start() {
    return Future.value();
  }

  @override
  Future<void> stop() {
    return Future.value();
  }
}
