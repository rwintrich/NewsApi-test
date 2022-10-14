import 'package:challenger_flutter_deloitte/core/constants/strings.dart';
import 'package:challenger_flutter_deloitte/core/failures_sucesses/exceptions.dart';
import 'package:challenger_flutter_deloitte/core/services/api_service.dart';
import 'package:challenger_flutter_deloitte/core/services_locator.dart';
import 'package:challenger_flutter_deloitte/features/show_items/data/models/item_info_model.dart';

abstract class FetchFromRemoteDS {
  Future<List<ItemInfoModel>> fetchItems(String? searchText);
}

class FetchFromRemoteDSImpl implements FetchFromRemoteDS {
  final ApiService apiService = sl<ApiService>();

  @override
  Future<List<ItemInfoModel>> fetchItems(String? searchText) async {
    try {
      Map<String, dynamic> data = await apiService.getData(
          searchText != null ? Strings.apiEverything : Strings.apiSearchItem, {
        'apiKey': Strings.apiKey,
        if (searchText == null) 'country': 'br',
        if (searchText != null) 'q': searchText
      });
      List list = data["articles"];
      List<Map<String, dynamic>> mapList = [];
      for (int i = 0; i < list.length; i++) {
        Map<String, dynamic> map = list[i] as Map<String, dynamic>;
        mapList.add(map);
      }
      List<ItemInfoModel> items = [];
      for (int i = 0; i < mapList.length; i++) {
        ItemInfoModel itemInfoModel = ItemInfoModel.fromMap(mapList[i]);
        items.add(itemInfoModel);
      }
      return items;
    } catch (err) {
      throw const FetchException(message: 'Failed to get data');
    }
  }
}
