import 'package:challenger_flutter_deloitte/core/constants/strings.dart';
import 'package:challenger_flutter_deloitte/features/show_items/domain/repositories/fetch_repo_contract.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as httpClient;

class FetchRepoMock extends Mock implements FetchRepo {}

void main() {
  String? searchText = null;

  test("httpC", () async {
    final httpClient.Response response = await httpClient.get(Uri.parse(
            searchText != null ? Strings.apiEverything : Strings.apiSearchItem)
        .replace(queryParameters: {
      'apiKey': Strings.apiKey,
      if (searchText == null) 'country': 'br',
      if (searchText != null) 'q': searchText
    }));
    expect(response.statusCode == 200, true);
  });
}
