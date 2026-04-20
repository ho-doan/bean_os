import 'package:example/data/repositories/profile_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../fixtures.dart';
import '../../mocks.dart';

void main() {
  late MockAppRemoteDataSource remote;
  late MockAppLocalDataSource local;
  late ProfileRepositoryImpl repo;

  setUp(() {
    remote = MockAppRemoteDataSource();
    local = MockAppLocalDataSource();
    repo = ProfileRepositoryImpl(remote, local);
  });

  test('returns remote entity and caches profile', () async {
    when(() => remote.fetchProfile('1')).thenAnswer((_) async => tProfileModel);
    when(() => local.cacheProfile(tProfileModel)).thenAnswer((_) async {});

    final entity = await repo.getProfile('1');

    expect(entity, tProfileEntity);
    verify(() => local.cacheProfile(tProfileModel)).called(1);
  });

  test('returns remote entity when cache write fails', () async {
    when(() => remote.fetchProfile('1')).thenAnswer((_) async => tProfileModel);
    when(() => local.cacheProfile(tProfileModel)).thenThrow(Exception('disk'));

    final entity = await repo.getProfile('1');

    expect(entity, tProfileEntity);
  });

  test('returns cached profile when remote fails', () async {
    when(() => remote.fetchProfile('1')).thenThrow(Exception('network'));
    when(() => local.readProfile('1')).thenAnswer((_) async => tProfileModel);

    final entity = await repo.getProfile('1');

    expect(entity, tProfileEntity);
  });

  test('rethrows when remote fails and no cache', () async {
    when(() => remote.fetchProfile('1')).thenThrow(Exception('network'));
    when(() => local.readProfile('1')).thenAnswer((_) async => null);

    expect(() => repo.getProfile('1'), throwsException);
  });
}
