import 'package:bloc/bloc.dart';
import 'package:challenger_flutter_deloitte/core/failures_sucesses/exceptions.dart';
import 'package:challenger_flutter_deloitte/core/failures_sucesses/failures.dart';
import 'package:challenger_flutter_deloitte/core/services_locator.dart';
import 'package:challenger_flutter_deloitte/features/show_items/data/models/item_info_model.dart';
import 'package:challenger_flutter_deloitte/features/show_items/domain/entities/item_info.dart';
import 'package:challenger_flutter_deloitte/features/show_items/domain/usecases/fetch_items.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'items_state.dart';

class ItemsCubit extends Cubit<ItemsState> {
  ItemsCubit() : super(ItemsInitial(items: const []));
  final FetchItemsUsecase _fetchItemsUsecase = sl<FetchItemsUsecase>();

  void fetchItems(String? searchText) async {
    try {
      emit(ItemsLoading());
      final Either<Failure, List<ItemInfo>> fetchNewsResult =
          await _fetchItemsUsecase.fetchItems(searchText);
      fetchNewsResult.fold(
          (l) => {emit(ItemsError())},
          (items) => {
                if (searchText != null)
                  {
                    emit(ItemsInitialSearch(items: items)),
                  }
                else
                  {emit(ItemsInitial(items: items))}
              });
    } on FetchException catch (ex) {
      ex.toString();
    }
  }
}
