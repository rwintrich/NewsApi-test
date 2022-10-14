class ItemInfo {
  final String? title;
  final String? author;
  final String? imageURL;
  final String? content;
  final DateTime dateTime;
  ItemInfo(
      {this.title,
      this.author,
      this.imageURL,
      this.content,
      required this.dateTime});
}
