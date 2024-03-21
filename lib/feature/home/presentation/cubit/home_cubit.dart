import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/repositories/home_repository.dart';
import 'home_state.dart';

@lazySingleton
class HomeCubit extends Cubit<HomeState> {
  final HomeRepository _homeRepository;

  Timer? _debounce;

  HomeCubit(this._homeRepository) : super(HomeState.initial());

  Future search({required String searchKey}) async {
    emit(
      state.copyWith(isSearching: true, searchKey: searchKey, page: 1),
    );

    final result = await _homeRepository.search(
      searchKey: searchKey,
      page: state.page,
      pageLimit: state.pageLimit,
    );

    if (result.data != null && result.data!.isNotEmpty) {
      emit(
        state.copyWith(
          isSearching: false,
          images: result.data!.map((e) => e.avatar ?? '').toList(),
        ),
      );
    }
  }

  Future fetchMore() async {
    if (_debounce?.isActive ?? false) return;

    _debounce = Timer(
        const Duration(
          milliseconds: 500,
        ), () async {

      emit(state.copyWith(isFetching: true, page: state.page + 1));

      final result = await _homeRepository.search(
        searchKey: state.searchKey,
        page: state.page,
        pageLimit: state.pageLimit,
      );

      if (result.data != null && result.data!.isNotEmpty) {
        emit(
          state.copyWith(
            images: [
              ...state.images,
              ...result.data!.map((e) => e.avatar ?? '').toList(),
            ],
          ),
        );
      }

      emit(state.copyWith(isFetching: false));

      _debounce?.cancel();
    });
  }
}
