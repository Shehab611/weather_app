import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:weather_app/core/failure/failures.dart';
import 'package:weather_app/features/search_feature/data/models/search_model.dart';
import 'package:weather_app/features/search_feature/data/repo/search_repo.dart';

import '../../../../constants.dart';
import '../../../../core/utils/api_service.dart';

class SearchRepoImpl implements SearchRepo{
  @override
  Future<Either<Failure, SearchResultModel>> getSearchResult({required String cityName}) async{
    DioHelper.init(url: 'https://api.openweathermap.org/data/3.0/');
    try {
      var data = await DioHelper.getData(
          endPoint:
          'http://api.openweathermap.org/geo/1.0/direct?q=$cityName&appid=$kApiKey');

      return right(SearchResultModel.fromJson(data.data[0]));
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

}