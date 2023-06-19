// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:howabout_coffee/app/core/exceptions/user_not_found_exception.dart';
import 'package:howabout_coffee/app/data/models/client_model.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:uuid/uuid.dart';

import './user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  Future<bool> save(ClientModel client) async {
    throw UnimplementedError();
  }

  @override
  Future<ClientModel?> getUser() async {
    final parseUser = await ParseUser.currentUser() as ParseUser?;
    if (parseUser == null) {
      throw UserNotFoundException('User not found');
    }
    final ClientModel client = ClientModel.fromParse(parseUser);
    final userProfileResponse = await ParseObject('UserProfile').getObject(parseUser.get('userProfile')?.objectId);
    if (userProfileResponse.success) {
      final ParseObject userProfile = userProfileResponse.result;

      final avatar = (userProfile.get('avatar')?.get('url')) as String?;
      final phone = userProfile.get('phone_number') as String?;
      final name = userProfile.get('name') as String?;
      final totalCredit = userProfile.get('total_credit').toString();

      return client.copyWith(name: name, avatar: avatar, phoneNumber: phone, totalCredit: double.tryParse(totalCredit) ?? 0);
    }
    return client;
  }

  @override
  Future<ClientModel> updateUser({required ClientModel client, File? profilePicture}) async {
    final parseUser = await ParseUser.currentUser() as ParseUser?;
    if (parseUser == null) {
      throw UserNotFoundException('User not found');
    }
    final userProfileResponse = await ParseObject('UserProfile').getObject(parseUser.get('userProfile')?.objectId);
    if (userProfileResponse.success) {
      final ParseObject userProfile = userProfileResponse.result;

      userProfile.set('name', client.name);
      userProfile.set('phone_number', client.phoneNumber);
      if (profilePicture != null) {
        userProfile.set('avatar', (kIsWeb) ? ParseWebFile(profilePicture.readAsBytesSync(), name: const Uuid().v4()) : ParseFile(profilePicture));
      }

      final saveResponse = await userProfile.save();
      if (saveResponse.success) {
        final userProfile = (saveResponse.result as ParseObject);
        return client.copyWith(
          name: userProfile.get('name'),
          avatar: userProfile.get('avatar')?.get('url'),
          phoneNumber: userProfile.get('phone_nubmer'),
        );
      }
    }

    return client;
  }

  Future<ParseObject?> _getFavorite(ClientModel? user) async {
    QueryBuilder<ParseObject> query = QueryBuilder<ParseObject>(ParseObject('UserFavorite'));
    query.whereEqualTo('user', user?.id ?? '');
    final response = await query.query();
    if (response.success) {
      if (response.count == 0) {
        return null;
      }
      return (response.results as List).first as ParseObject?;
    }
    return null;
  }

  @override
  Future<List<int>> getFavoriteUser(ClientModel? user) async {
    final favorite = await _getFavorite(user);
    return (favorite?.get('favorites') as List).map<int>((e) => int.parse(e.toString())).toList();
  }

  @override
  Future<List<int>> manageFavorites(ClientModel client, int productId) async {
    final favoriteUser = await _getFavorite(client);
    final favorites = (favoriteUser?.get('favorites') as List).map<int>((e) => int.parse(e.toString())).toList();
    if (favorites.contains(productId)) {
      favorites.remove(productId);
    } else {
      favorites.add(productId);
    }
    favoriteUser?.set('favorites', favorites);
    favoriteUser?.save();
    return favorites;
  }
}
