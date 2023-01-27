import 'package:dartz/dartz.dart';

import '../../../../core/failure/failures.dart';
import '../models/search_model.dart';

abstract class SearchRepo{

  Future<Either<Failure, SearchResultModel>> getSearchResult({required String cityName});

}