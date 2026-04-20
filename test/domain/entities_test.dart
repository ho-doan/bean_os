import 'package:example/domain/entities/chat_entity.dart';
import 'package:example/domain/entities/contact_entity.dart';
import 'package:example/domain/entities/profile_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../fixtures.dart';

void main() {
  group('ProfileEntity', () {
    test('props equality', () {
      expect(tProfileEntity, const ProfileEntity(id: '1', name: 'Alice', bio: 'Bio'));
      expect(
        tProfileEntity,
        isNot(const ProfileEntity(id: '1', name: 'Alice', bio: 'Other')),
      );
    });
  });

  group('ContactEntity', () {
    test('props equality', () {
      expect(tContactEntity, const ContactEntity(id: 'c1', name: 'Bob'));
    });
  });

  group('ChatEntity', () {
    test('props equality', () {
      expect(tChatEntity, tChatEntity);
      expect(
        tChatEntity,
        isNot(const ChatEntity(id: '0', title: 'Other', lastMessage: 'Hi')),
      );
    });
  });
}
