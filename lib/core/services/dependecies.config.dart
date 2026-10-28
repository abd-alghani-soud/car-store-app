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
import '../../features/auth/data/repositories/auth_repo_impl.dart' as _i662;
import '../../features/auth/domain/repositories/auth_repo.dart' as _i723;
import '../../features/auth/domain/usecases/login_use_case.dart' as _i37;
import '../../features/auth/domain/usecases/signup_use_case.dart' as _i229;
import '../../features/auth/presentation/manager/auth_cubit/auth_cubit.dart'
    as _i343;
import '../../features/favorites/data/datasource/favorites_remote_datasource.dart'
    as _i25;
import '../../features/favorites/data/repository/favorites_repo_impl.dart'
    as _i697;
import '../../features/favorites/domain/repository/favorites_repo.dart'
    as _i1005;
import '../../features/favorites/domain/usecase/get_my_favorites_usecase.dart'
    as _i623;
import '../../features/favorites/domain/usecase/toggle_favorite_usecase.dart'
    as _i692;
import '../../features/favorites/presentation/bloc/favorite_bloc.dart' as _i866;
import '../../features/home/data/datasource/brands_remote_datasource.dart'
    as _i817;
import '../../features/home/data/datasource/cars_remote_datasource.dart'
    as _i242;
import '../../features/home/data/repository/brand_repo_imp.dart' as _i880;
import '../../features/home/data/repository/car_repo_imp.dart' as _i376;
import '../../features/home/domain/repository/brand_repo.dart' as _i656;
import '../../features/home/domain/repository/car_repo.dart' as _i288;
import '../../features/home/domain/usecase/brands/create_brand_usecase.dart'
    as _i571;
import '../../features/home/domain/usecase/brands/delete_brand_usecase.dart'
    as _i945;
import '../../features/home/domain/usecase/brands/get_all_brands_usecase.dart'
    as _i829;
import '../../features/home/domain/usecase/brands/get_brand_by_id_usecase.dart'
    as _i535;
import '../../features/home/domain/usecase/brands/update_brand_usecase.dart'
    as _i315;
import '../../features/home/domain/usecase/cars/add_car_usecase.dart' as _i220;
import '../../features/home/domain/usecase/cars/delete_car_usecase.dart'
    as _i933;
import '../../features/home/domain/usecase/cars/get_car_by_id_usecase.dart'
    as _i727;
import '../../features/home/domain/usecase/cars/get_car_images_usecase.dart'
    as _i983;
import '../../features/home/domain/usecase/cars/get_my_cars_usecase.dart'
    as _i408;
import '../../features/home/domain/usecase/cars/get_public_cars_usecase.dart'
    as _i352;
import '../../features/home/domain/usecase/cars/search_cars_usecase.dart'
    as _i939;
import '../../features/home/domain/usecase/cars/update_car_usecase.dart'
    as _i493;
import '../../features/home/presentation/bloc/brands/brands_bloc.dart' as _i950;
import '../../features/home/presentation/bloc/cars/cars_bloc.dart' as _i447;
import '../cubit/theme_cubit.dart' as _i319;
import '../network/network_checker.dart' as _i387;
import 'api_service.dart' as _i738;
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
    gh.lazySingleton<_i738.ApiService>(() => _i738.ApiService(gh<_i361.Dio>()));
    gh.factory<_i25.FavoritesRemoteDatasource>(
      () => _i25.FavoritesRemoteDatasourceImp(gh<_i738.ApiService>()),
    );
    gh.factory<_i107.AuthRemoteDataSource>(
      () => _i107.AuthRemoteDataSourceImpl(apiService: gh<_i738.ApiService>()),
    );
    gh.factory<_i817.BrandsRemoteDatasource>(
      () => _i817.BrandsRemoteDatasourceImp(apiService: gh<_i738.ApiService>()),
    );
    gh.factory<_i242.CarsRemoteDatasource>(
      () => _i242.CarsRemoteDatasourceImp(gh<_i738.ApiService>()),
    );
    gh.factory<_i288.CarRepo>(
      () => _i376.CarRepoImp(gh<_i242.CarsRemoteDatasource>()),
    );
    gh.factory<_i656.BrandRepo>(
      () => _i880.BrandRepoImp(gh<_i817.BrandsRemoteDatasource>()),
    );
    gh.factory<_i1005.FavoritesRepo>(
      () => _i697.FavoritesRepoImpl(gh<_i25.FavoritesRemoteDatasource>()),
    );
    gh.factory<_i220.AddCarUsecase>(
      () => _i220.AddCarUsecase(gh<_i288.CarRepo>()),
    );
    gh.factory<_i933.DeleteCarUsecase>(
      () => _i933.DeleteCarUsecase(gh<_i288.CarRepo>()),
    );
    gh.factory<_i727.GetCarByIdUsecase>(
      () => _i727.GetCarByIdUsecase(gh<_i288.CarRepo>()),
    );
    gh.factory<_i983.GetCarImagesUsecase>(
      () => _i983.GetCarImagesUsecase(gh<_i288.CarRepo>()),
    );
    gh.factory<_i408.GetMyCarsUsecase>(
      () => _i408.GetMyCarsUsecase(gh<_i288.CarRepo>()),
    );
    gh.factory<_i352.GetPublicCarsUseCase>(
      () => _i352.GetPublicCarsUseCase(gh<_i288.CarRepo>()),
    );
    gh.factory<_i939.SearchCarsUsecase>(
      () => _i939.SearchCarsUsecase(gh<_i288.CarRepo>()),
    );
    gh.factory<_i493.UpdateCarUsecase>(
      () => _i493.UpdateCarUsecase(gh<_i288.CarRepo>()),
    );
    gh.factory<_i723.AuthRepo>(
      () => _i662.AuthRepoImpl(
        authRemoteDataSource: gh<_i107.AuthRemoteDataSource>(),
      ),
    );
    gh.factory<_i37.LoginUseCase>(
      () => _i37.LoginUseCase(authRepo: gh<_i723.AuthRepo>()),
    );
    gh.factory<_i229.SignupUseCase>(
      () => _i229.SignupUseCase(authRepo: gh<_i723.AuthRepo>()),
    );
    gh.lazySingleton<_i343.AuthCubit>(
      () => _i343.AuthCubit(
        signupUseCase: gh<_i229.SignupUseCase>(),
        loginUseCase: gh<_i37.LoginUseCase>(),
      ),
    );
    gh.factory<_i623.GetMyFavoritesUseCase>(
      () => _i623.GetMyFavoritesUseCase(gh<_i1005.FavoritesRepo>()),
    );
    gh.factory<_i692.ToggleFavoriteUseCase>(
      () => _i692.ToggleFavoriteUseCase(gh<_i1005.FavoritesRepo>()),
    );
    gh.factory<_i571.CreateBrandUsecase>(
      () => _i571.CreateBrandUsecase(gh<_i656.BrandRepo>()),
    );
    gh.factory<_i945.DeleteBrandUsecase>(
      () => _i945.DeleteBrandUsecase(gh<_i656.BrandRepo>()),
    );
    gh.factory<_i829.GetAllBrandsUsecase>(
      () => _i829.GetAllBrandsUsecase(gh<_i656.BrandRepo>()),
    );
    gh.factory<_i535.GetBrandByIdUsecase>(
      () => _i535.GetBrandByIdUsecase(gh<_i656.BrandRepo>()),
    );
    gh.factory<_i315.UpdateBrandUsecase>(
      () => _i315.UpdateBrandUsecase(gh<_i656.BrandRepo>()),
    );
    gh.lazySingleton<_i447.CarsBloc>(
      () => _i447.CarsBloc(
        gh<_i352.GetPublicCarsUseCase>(),
        gh<_i727.GetCarByIdUsecase>(),
        gh<_i983.GetCarImagesUsecase>(),
        gh<_i939.SearchCarsUsecase>(),
        gh<_i408.GetMyCarsUsecase>(),
        gh<_i220.AddCarUsecase>(),
        gh<_i933.DeleteCarUsecase>(),
        gh<_i493.UpdateCarUsecase>(),
      ),
    );
    gh.lazySingleton<_i950.BrandsBloc>(
      () => _i950.BrandsBloc(
        gh<_i829.GetAllBrandsUsecase>(),
        gh<_i535.GetBrandByIdUsecase>(),
        gh<_i571.CreateBrandUsecase>(),
        gh<_i945.DeleteBrandUsecase>(),
        gh<_i315.UpdateBrandUsecase>(),
      ),
    );
    gh.lazySingleton<_i866.FavoriteBloc>(
      () => _i866.FavoriteBloc(
        gh<_i623.GetMyFavoritesUseCase>(),
        gh<_i692.ToggleFavoriteUseCase>(),
      ),
    );
    return this;
  }
}

class _$InjectionModule extends _i1048.InjectionModule {}
