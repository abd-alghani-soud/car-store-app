// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:http/http.dart' as _i519;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i973;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../features/auth/data/datasources/auth_remote_data_source.dart'
    as _i107;
import '../../features/auth/data/repositories/login_repo_impl.dart' as _i886;
import '../../features/auth/data/repositories/signup_repo_impl.dart' as _i356;
import '../../features/auth/domain/repositories/login_repo.dart' as _i502;
import '../../features/auth/domain/repositories/signup_repo.dart' as _i812;
import '../../features/auth/domain/usecases/login_use_case.dart' as _i37;
import '../../features/auth/domain/usecases/signup_use_case.dart' as _i229;
import '../../features/auth/presentation/manager/login_cubit/login_cubit.dart'
    as _i863;
import '../../features/auth/presentation/manager/signup_Cubit/signup_cubit.dart'
    as _i81;
import '../cubit/theme_cubit.dart' as _i319;
import '../network/network_checker.dart' as _i387;
import 'api.dart' as _i937;
import 'dependecies.dart' as _i1048;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> initGetIt({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final injectionModule = _$InjectionModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => injectionModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i319.ThemeCubit>(() => _i319.ThemeCubit());
    gh.lazySingleton<_i973.InternetConnectionChecker>(
      () => injectionModule.connectionChecker,
    );
    gh.lazySingleton<_i519.Client>(() => injectionModule.httpClient);
    gh.lazySingleton<_i361.Dio>(() => injectionModule.dio);
    gh.factory<_i387.NetworkChecker>(
      () => _i387.NetworkCheckerImp(gh<_i973.InternetConnectionChecker>()),
    );
    gh.factory<_i937.Api>(() => _i937.Api(gh<_i361.Dio>()));
    gh.lazySingleton<_i107.AuthRemoteDataSource>(
      () => _i107.AuthRemoteDataSourceImpl(api: gh<_i937.Api>()),
    );
    gh.lazySingleton<_i502.LoginRepo>(
      () => _i886.LoginRepoImpl(
        authRemoteDataSource: gh<_i107.AuthRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i812.SignupRepo>(
      () => _i356.SignupRepoImpl(
        authRemoteDataSource: gh<_i107.AuthRemoteDataSource>(),
      ),
    );
    gh.factory<_i37.LoginUseCase>(
      () => _i37.LoginUseCase(loginRepo: gh<_i502.LoginRepo>()),
    );
    gh.factory<_i229.SignupUseCase>(
      () => _i229.SignupUseCase(signupRepo: gh<_i812.SignupRepo>()),
    );
    gh.factory<_i863.LoginCubit>(
      () => _i863.LoginCubit(loginUseCase: gh<_i37.LoginUseCase>()),
    );
    gh.factory<_i81.SignupCubit>(
      () => _i81.SignupCubit(signupUseCase: gh<_i229.SignupUseCase>()),
    );
    return this;
  }
}

class _$InjectionModule extends _i1048.InjectionModule {}
