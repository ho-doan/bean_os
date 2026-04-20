import 'package:example/presentation/bloc/profile/profile_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../fixtures.dart';
import '../helpers/bloc_harness.dart';
import '../mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockGetProfileUseCase mockUseCase;

  setUp(() {
    mockUseCase = MockGetProfileUseCase();
  });

  setUpAll(() {
    registerFallbackValue('');
  });

  test('started: emits loading then success', () async {
    when(() => mockUseCase(any())).thenAnswer((_) async => tProfileEntity);

    final bloc = ProfileBloc(mockUseCase);
    addTearDown(bloc.close);

    await expectBlocEmissions<ProfileState>(
      bloc.stream,
      [
        isA<ProfileState>().having((s) => s.status, 's', ProfileStatus.loading),
        isA<ProfileState>()
            .having((s) => s.status, 's', ProfileStatus.success)
            .having((s) => s.profile, 'p', tProfileEntity),
      ],
      () async => bloc.add(const ProfileEvent.started(profileId: '1')),
    );

    verify(() => mockUseCase('1')).called(1);
  });

  test('started: emits loading then failure', () async {
    when(() => mockUseCase(any())).thenThrow(Exception('fail'));

    final bloc = ProfileBloc(mockUseCase);
    addTearDown(bloc.close);

    await expectBlocEmissions<ProfileState>(
      bloc.stream,
      [
        isA<ProfileState>().having((s) => s.status, 's', ProfileStatus.loading),
        isA<ProfileState>()
            .having((s) => s.status, 's', ProfileStatus.failure)
            .having((s) => s.errorMessage, 'e', contains('fail')),
      ],
      () async => bloc.add(const ProfileEvent.started(profileId: '1')),
    );
  });
}
