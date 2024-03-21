import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:saberion_assessment/app/network/network.dart';

import '../../domain/dto/search_response.dart';

@lazySingleton
class HomeRemoteProvider {
  final Network _network;

  HomeRemoteProvider(this._network);

  Future<SearchResponse> search(
      {required String searchKey,
      required int page,
      required int pageLimit}) async {
    try {
      final result = await _network.request(
        '/api/users?page=$page&per_page=$pageLimit&search=$searchKey',
        'GET',
        {},
      );

      return SearchResponse.fromJson(
        result.data,
      );
    } catch (ex) {
      return SearchResponse();
    }
  }
}
