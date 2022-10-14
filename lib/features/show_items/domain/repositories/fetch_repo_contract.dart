import 'package:challenger_flutter_deloitte/core/failures_sucesses/failures.dart';
import 'package:challenger_flutter_deloitte/features/show_items/domain/entities/item_info.dart';
import 'package:dartz/dartz.dart';

abstract class FetchRepo {
  Future<Either<Failure, List<ItemInfo>>> fetchItems(String? searchText);
}
