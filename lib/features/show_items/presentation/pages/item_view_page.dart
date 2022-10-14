import 'package:challenger_flutter_deloitte/core/constants/pallete.dart';
import 'package:challenger_flutter_deloitte/features/show_items/domain/entities/item_info.dart';
import 'package:flutter/material.dart';

class ItemViewPage extends StatelessWidget {
  ItemViewPage({Key? key, required this.itemsInfo}) : super(key: key);
  ItemInfo itemsInfo;
  String _getDateInDDDMMYYYYFormat(DateTime dateTime) {
    return '${dateTime.day} / ${dateTime.month} / ${dateTime.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.background,
      appBar: AppBar(
        backgroundColor: Pallete.background,
        elevation: 0,
        leading: IconButton(
          onPressed: () => {Navigator.pop(context)},
          icon: const Icon(Icons.arrow_back_ios_new_rounded,
              color: Pallete.white, size: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(itemsInfo.title ?? "---No TITLE--",
                  style: TextStyle(
                    color: Pallete.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 300,
                child: Container(
                  color: Pallete.lightPurple,
                  child: itemsInfo.imageURL != null
                      ? Image.network(itemsInfo.imageURL!, fit: BoxFit.cover)
                      : const SizedBox(),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                _getDateInDDDMMYYYYFormat(itemsInfo.dateTime),
                style: TextStyle(color: Pallete.lightPurple, fontSize: 14),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                itemsInfo.author ?? 'No Author',
                style: TextStyle(color: Pallete.lightPurple, fontSize: 14),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                itemsInfo.content ?? 'No Content',
                style: TextStyle(color: Pallete.white, fontSize: 14),
              ),
              const SizedBox(
                height: 32,
              )
            ],
          ),
        ),
      ),
    );
  }
}
