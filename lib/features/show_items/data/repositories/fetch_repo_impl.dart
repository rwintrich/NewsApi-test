import 'package:challenger_flutter_deloitte/core/failures_sucesses/exceptions.dart';
import 'package:challenger_flutter_deloitte/features/show_items/data/data_sources/fetch_from_remote_ds.dart';
import 'package:challenger_flutter_deloitte/features/show_items/domain/entities/item_info.dart';
import 'package:challenger_flutter_deloitte/core/failures_sucesses/failures.dart';
import 'package:challenger_flutter_deloitte/features/show_items/domain/repositories/fetch_repo_contract.dart';
import 'package:dartz/dartz.dart';
import 'package:challenger_flutter_deloitte/core/services_locator.dart';

class FetchRepoImpl implements FetchRepo {
  final FetchFromRemoteDS fetchFromRemoteDS = sl<FetchFromRemoteDS>();

  @override
  Future<Either<Failure, List<ItemInfo>>> fetchItems(String? searchText) async {
    try {
      return Right(await fetchFromRemoteDS.fetchItems(searchText));
    } on FetchException catch (ex) {
      return Left(FetchFailure(message: ex.message));
    }
  }
}
