import 'package:challenger_flutter_deloitte/core/services/api_service.dart';
import 'package:challenger_flutter_deloitte/features/show_items/data/data_sources/fetch_from_remote_ds.dart';
import 'package:challenger_flutter_deloitte/features/show_items/data/repositories/fetch_repo_impl.dart';
import 'package:challenger_flutter_deloitte/features/show_items/domain/repositories/fetch_repo_contract.dart';
import 'package:challenger_flutter_deloitte/features/show_items/domain/usecases/fetch_items.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

void setUpServices() {
  sl.registerSingleton<ApiService>(ApiServiceImpl());
  sl.registerSingleton<FetchFromRemoteDS>(FetchFromRemoteDSImpl());
  sl.registerSingleton<FetchRepo>(FetchRepoImpl());
  sl.registerSingleton<FetchItemsUsecase>(FetchItemsUsecase());
}
