import 'package:injectable/injectable.dart';
import 'package:saberion_assessment/feature/home/domain/dto/search_response.dart';
import '../../domain/repositories/home_repository.dart';
import '../providers/home_remote_provider.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl extends HomeRepository {
  final HomeRemoteProvider _remoteProvider;

  HomeRepositoryImpl(this._remoteProvider);

  @override
  Future<SearchResponse> search({required String searchKey, required int page, required int pageLimit}) async {
    return await _remoteProvider.search(searchKey: searchKey, page: page, pageLimit: pageLimit);
  }
}
