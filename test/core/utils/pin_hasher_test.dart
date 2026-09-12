import 'package:flutter_test/flutter_test.dart';
import 'package:slowjourney/core/utils/pin_hasher.dart';

void main() {
  test('same pin and profile produce a stable hash', () {
    final first = PinHasher.hash('1234', 'profile-a');
    final second = PinHasher.hash('1234', 'profile-a');
    expect(first, second);
    expect(first.length, 64);
  });

  test('different profiles do not share a pin hash', () {
    final first = PinHasher.hash('1234', 'profile-a');
    final second = PinHasher.hash('1234', 'profile-b');
    expect(first, isNot(second));
  });

  test('matches accepts only the stored pin', () {
    final stored = PinHasher.hash('2468', 'profile-a');
    expect(PinHasher.matches('2468', 'profile-a', stored), isTrue);
    expect(PinHasher.matches('0000', 'profile-a', stored), isFalse);
  });

  test('isValid accepts exactly four digits', () {
    expect(PinHasher.isValid('1234'), isTrue);
    expect(PinHasher.isValid('123456'), isFalse);
    expect(PinHasher.isValid('123'), isFalse);
    expect(PinHasher.isValid('12345'), isFalse);
    expect(PinHasher.isValid('12ab'), isFalse);
    expect(PinHasher.isValid(''), isFalse);
  });
}
