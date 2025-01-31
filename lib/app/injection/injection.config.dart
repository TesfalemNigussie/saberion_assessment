// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:saberion_assessment/app/network/network.dart' as _i3;
import 'package:saberion_assessment/feature/home/data/providers/home_remote_provider.dart'
    as _i4;
import 'package:saberion_assessment/feature/home/data/repositories/home_repository.dart'
    as _i6;
import 'package:saberion_assessment/feature/home/domain/repositories/home_repository.dart'
    as _i5;
import 'package:saberion_assessment/feature/home/presentation/cubit/home_cubit.dart'
    as _i7;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    await gh.singletonAsync<_i3.Network>(
      () {
        final i = _i3.Network();
        return i.initialize().then((_) => i);
      },
      preResolve: true,
    );
    gh.lazySingleton<_i4.HomeRemoteProvider>(
        () => _i4.HomeRemoteProvider(gh<_i3.Network>()));
    gh.lazySingleton<_i5.HomeRepository>(
        () => _i6.HomeRepositoryImpl(gh<_i4.HomeRemoteProvider>()));
    gh.lazySingleton<_i7.HomeCubit>(
        () => _i7.HomeCubit(gh<_i5.HomeRepository>()));
    return this;
  }
}
