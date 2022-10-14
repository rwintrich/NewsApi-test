import 'package:challenger_flutter_deloitte/core/failures_sucesses/failures.dart';
import 'package:challenger_flutter_deloitte/core/services_locator.dart';
import 'package:challenger_flutter_deloitte/features/show_items/domain/entities/item_info.dart';
import 'package:challenger_flutter_deloitte/features/show_items/domain/repositories/fetch_repo_contract.dart';
import 'package:dartz/dartz.dart';

class FetchItemsUsecase {
  final FetchRepo fetchRepo = sl<FetchRepo>();

  Future<Either<Failure, List<ItemInfo>>> fetchItems(String? searchText) {
    return fetchRepo.fetchItems(searchText);
  }
}
