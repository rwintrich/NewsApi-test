import 'package:challenger_flutter_deloitte/features/show_items/domain/entities/item_info.dart';

class ItemInfoModel extends ItemInfo {
  ItemInfoModel(
      {String? title,
      String? author,
      String? imageURL,
      String? content,
      String? dateTime})
      : super(
            title: title,
            author: author,
            imageURL: imageURL,
            content: content,
            dateTime: _getDataTimeInDateTime(dateTime));

  static DateTime _getDataTimeInDateTime(String? dateTime) {
    if (dateTime == null) {
      return DateTime.now();
    } else {
      final DateTime? dateTimeInDateFormat = DateTime.parse(dateTime);
      if (dateTimeInDateFormat == null) {
        return DateTime.now();
      } else {
        return dateTimeInDateFormat;
      }
    }
  }

  factory ItemInfoModel.fromMap(Map<String, dynamic> map) {
    return ItemInfoModel(
        title: map["title"],
        author: map["author"],
        imageURL: map["urlToImage"],
        content: map["content"],
        dateTime: map["publishedAt"]);
  }
}
