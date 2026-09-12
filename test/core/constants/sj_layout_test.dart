import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:slowjourney/core/constants/sj_layout.dart';

void main() {
  test('phone portrait keeps the floating bottom navigation', () {
    expect(
      SjLayout.useSideNavigation(const Size(390, 844)),
      isFalse,
    );
  });

  test('phone landscape uses a navigation rail', () {
    expect(
      SjLayout.useSideNavigation(const Size(844, 390)),
      isTrue,
    );
  });

  test('large and tablet screens use a navigation rail', () {
    expect(
      SjLayout.useSideNavigation(const Size(834, 1194)),
      isTrue,
    );
    expect(
      SjLayout.useSideNavigation(const Size(1194, 834)),
      isTrue,
    );
    expect(
      SjLayout.useSideNavigation(const Size(600, 800)),
      isTrue,
    );
  });
}
