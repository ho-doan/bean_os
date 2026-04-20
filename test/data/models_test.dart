import 'package:example/data/models/chat_model.dart';
import 'package:example/data/models/contact_model.dart';
import 'package:example/data/models/profile_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../fixtures.dart';

void main() {
  group('ProfileModel', () {
    test('toJson / fromJson roundtrip', () {
      final json = tProfileModel.toJson();
      expect(ProfileModel.fromJson(json), tProfileModel);
    });

    test('toEntity maps fields', () {
      expect(tProfileModel.toEntity().id, '1');
      expect(tProfileModel.toEntity().name, 'Alice');
    });
  });

  group('ContactModel', () {
    test('toJson / fromJson roundtrip', () {
      final json = tContactModel.toJson();
      expect(ContactModel.fromJson(json), tContactModel);
    });

    test('toEntity maps fields', () {
      expect(tContactModel.toEntity().id, 'c1');
    });
  });

  group('ChatModel', () {
    test('toJson / fromJson roundtrip', () {
      final json = tChatModel.toJson();
      expect(ChatModel.fromJson(json), tChatModel);
    });

    test('toEntity maps fields', () {
      expect(tChatModel.toEntity().title, 'Chat 0');
    });
  });
}
