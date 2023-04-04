//@dart=2.9
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Firebase Authentication Mock Test', () {
    MockUser mockUser;

    setUp(() {
      mockUser = MockUser(
        isAnonymous: false,
        email: 'kimiraikkonen@testmail.com',
        displayName: 'Kimi Raikkonen',
      );
    });

    test('Sign-In with Email and Password', () async {
      final auth = MockFirebaseAuth(mockUser: mockUser);
      const email = 'testing email';
      const password = 'testing password';
      final result = await auth.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      final user = result.user;

      expect(user, mockUser);
      expect(auth.authStateChanges(), emitsInOrder([null, isA<User>()]));
      expect(auth.userChanges(), emitsInOrder([null, isA<User>()]));
    });

    test('Sign-Up Email and Password', () async {
      const email = 'testing@emailtest.com';
      const password = 'testing_password_23';
      final auth = MockFirebaseAuth();
      final result = await auth.createUserWithEmailAndPassword(
          email: email,
          password: password);
      final user = result.user;

      expect(user.email, email);
      expect(user.isAnonymous, isFalse);

      final providerData = user.providerData;
      expect(providerData.length, 1);
      expect(providerData.first.providerId, 'password');
      expect(providerData.first.email, email);
      expect(providerData.first.uid, user.uid);

      expect(auth.authStateChanges(), emitsInOrder([null, isA<User>()]));
      expect(auth.userChanges(), emitsInOrder([null, isA<User>()]));
    });
  });
}