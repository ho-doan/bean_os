import 'package:example/data/models/chat_model.dart';
import 'package:example/data/models/contact_model.dart';
import 'package:example/data/models/profile_model.dart';
import 'package:example/domain/entities/chat_entity.dart';
import 'package:example/domain/entities/contact_entity.dart';
import 'package:example/domain/entities/profile_entity.dart';

/// Dữ liệu mẫu dùng chung cho unit test.
const tProfileEntity = ProfileEntity(id: '1', name: 'Alice', bio: 'Bio');

const tProfileModel = ProfileModel(id: '1', name: 'Alice', bio: 'Bio');

const tContactEntity = ContactEntity(id: 'c1', name: 'Bob');

const tContactModel = ContactModel(id: 'c1', name: 'Bob');

const tChatEntity = ChatEntity(
  id: '0',
  title: 'Chat 0',
  lastMessage: 'Hi',
);

const tChatModel = ChatModel(
  id: '0',
  title: 'Chat 0',
  lastMessage: 'Hi',
);

final tChatModels = [
  tChatModel,
  const ChatModel(id: '1', title: 'Chat 1', lastMessage: null),
];

final tContactModels = [
  tContactModel,
  const ContactModel(id: 'c2', name: 'Carol'),
];
