import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  const HomeState({
    required this.images,
    required this.page,
    required this.searchKey,
    required this.pageLimit,
    required this.isFetching,
    required this.isSearching,
  });

  final List<String> images;
  final bool isFetching;
  final bool isSearching;
  final String searchKey;
  final int page;
  final int pageLimit;

  factory HomeState.initial() => const HomeState(
        images: [],
        page: 1,
        pageLimit: 6,
        isFetching: false,
        isSearching: false,
        searchKey: '',
      );

  copyWith({
    List<String>? images,
    int? page,
    int? pageLimit,
    bool? isFetching,
    bool? isSearching,
    String? searchKey,
  }) {
    return HomeState(
      images: images ?? this.images,
      page: page ?? this.page,
      pageLimit: pageLimit ?? this.pageLimit,
      isFetching: isFetching ?? this.isFetching,
      isSearching: isSearching ?? this.isSearching,
      searchKey: searchKey ?? this.searchKey,
    );
  }

  @override
  List<Object> get props => [
        images,
        page,
        pageLimit,
        isFetching,
        isSearching,
        searchKey,
      ];
}
