
import '../dto/search_response.dart';

abstract class HomeRepository {
  Future<SearchResponse> search(
      {required String searchKey, required int page, required int pageLimit});
}
