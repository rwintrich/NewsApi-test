import 'package:challenger_flutter_deloitte/core/constants/pallete.dart';
import 'package:challenger_flutter_deloitte/features/show_items/domain/entities/item_info.dart';
import 'package:challenger_flutter_deloitte/features/show_items/presentation/pages/item_view_page.dart';
import 'package:flutter/material.dart';

class ItemsCard extends StatelessWidget {
  final ItemInfo itemsInfo;
  const ItemsCard({Key? key, required this.itemsInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ItemViewPage(
          itemsInfo: itemsInfo,
        );
      })),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: SizedBox(
            height: 300,
            width: MediaQuery.of(context).size.width - (2 * 13),
            child: Stack(
              children: [
                Container(
                  height: 260,
                  color: Pallete.lightPurple,
                  child: itemsInfo.imageURL != null
                      ? Image.network(itemsInfo.imageURL!, fit: BoxFit.cover)
                      : const SizedBox(),
                ),
                Positioned(
                    left: 16,
                    right: 16,
                    bottom: 0,
                    child: Container(
                      height: 80,
                      width: MediaQuery.of(context).size.width - (2 * 32),
                      decoration: const BoxDecoration(
                          color: Pallete.lightPurple,
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 2),
                                blurRadius: 4,
                                color: Colors.black12),
                          ]),
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Center(
                          child: Text(
                            itemsInfo.title ?? "---No Title Text---",
                            maxLines: 2,
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              color: Pallete.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ))
              ],
            )),
      ),
    );
  }
}
