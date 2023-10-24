import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rentapp/core/core.dart';
import 'package:rentapp/features/auth/auth.dart';

class MockAuthRepository extends Mock implements IAuthRepository {}

void main() {
  group('IAuthRepository Tests', () {
    late IAuthRepository authRepository;
    setUp(() {
      authRepository = MockAuthRepository();
    });
    final user = User(
      id: 0,
      name: 'Brayan',
      surname: 'Cantos',
      birthdate: '1997-09-90',
      username: 'brayanc',
      createdAt: DateTime.now(),
    );
    group('Test Login Method', () {
      final loginRequest = LoginRequest(username: 'brayan', password: '123456');
      test('Login Successfull', () async {
        const token = 'bearer token';
        final loginResponse = LoginResponse(token: token, user: user);
        when(() => authRepository.login(loginRequest: loginRequest)).thenAnswer(
          (_) async => Future.value(Either.right(loginResponse)),
        );
        final result = await authRepository.login(loginRequest: loginRequest);
        final loginResult = Either<HttpRequestFailure, LoginResponse>.right(
          loginResponse,
        );
        expect(result, equals(loginResult));
        verify(() => authRepository.login(loginRequest: loginRequest))
            .called(1);
      });

      test('Login User Not Found', () async {
        final forbidden = HttpRequestFailure.forbidden();
        when(() => authRepository.login(loginRequest: loginRequest)).thenAnswer(
          (_) async => Future.value(Either.left(forbidden)),
        );
        final result = await authRepository.login(loginRequest: loginRequest);
        final loginResult = Either<HttpRequestFailure, LoginResponse>.left(
          forbidden,
        );
        expect(result, equals(loginResult));
        verify(() => authRepository.login(loginRequest: loginRequest))
            .called(1);
      });

      test('Login Password Invalid', () async {
        final notFound = HttpRequestFailure.notFound();
        when(() => authRepository.login(loginRequest: loginRequest)).thenAnswer(
          (_) async => Future.value(Either.left(notFound)),
        );
        final result = await authRepository.login(loginRequest: loginRequest);
        final loginResult = Either<HttpRequestFailure, LoginResponse>.left(
          notFound,
        );
        expect(result, equals(loginResult));
        verify(() => authRepository.login(loginRequest: loginRequest))
            .called(1);
      });

      test('Login Not Internet Connection', () async {
        final network = HttpRequestFailure.network();
        when(() => authRepository.login(loginRequest: loginRequest)).thenAnswer(
          (_) async => Future.value(Either.left(network)),
        );
        final result = await authRepository.login(loginRequest: loginRequest);
        final loginResult = Either<HttpRequestFailure, LoginResponse>.left(
          network,
        );
        expect(result, equals(loginResult));
        verify(() => authRepository.login(loginRequest: loginRequest))
            .called(1);
      });
    });

    group('Test Register Method', () {
      final registerRequest = RegisterRequest(
        name: 'Brayan',
        surname: 'Cantos',
        birthdate: '1997-09-09',
        password: 'test123',
        address: 'Costa Azul, Manta, Ecuador',
        username: 'brayanc',
      );
      test('Register Successfull', () async {
        when(() => authRepository.register(registerRequest: registerRequest))
            .thenAnswer(
          (_) async => Future.value(Either.right(user)),
        );
        final result = await authRepository.register(
          registerRequest: registerRequest,
        );
        final registerResult = Either<HttpRequestFailure, User>.right(
          user,
        );
        expect(result, equals(registerResult));
        verify(() => authRepository.register(registerRequest: registerRequest))
            .called(1);
      });

      test('Register the username has already been taken.', () async {
        final unprocessableEntity = HttpRequestFailure.unprocessableEntity();
        when(() => authRepository.register(registerRequest: registerRequest))
            .thenAnswer(
          (_) async => Future.value(Either.left(unprocessableEntity)),
        );
        final result = await authRepository.register(
          registerRequest: registerRequest,
        );
        final registerResult = Either<HttpRequestFailure, User>.left(
          unprocessableEntity,
        );
        expect(result, equals(registerResult));
        verify(() => authRepository.register(registerRequest: registerRequest))
            .called(1);
      });

      test('Register Not Internet Connection.', () async {
        final network = HttpRequestFailure.network();
        when(() => authRepository.register(registerRequest: registerRequest))
            .thenAnswer(
          (_) async => Future.value(Either.left(network)),
        );
        final result = await authRepository.register(
          registerRequest: registerRequest,
        );
        final registerResult = Either<HttpRequestFailure, User>.left(
          network,
        );
        expect(result, equals(registerResult));
        verify(() => authRepository.register(registerRequest: registerRequest))
            .called(1);
      });
    });
  });
}
