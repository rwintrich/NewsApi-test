import 'package:challenger_flutter_deloitte/core/constants/pallete.dart';

import 'package:challenger_flutter_deloitte/features/show_items/presentation/items_cubit/items_cubit.dart';
import 'package:challenger_flutter_deloitte/features/show_items/presentation/pages/components/items_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<ItemsCubit>().fetchItems(null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Pallete.background,
        appBar: AppBar(
          backgroundColor: Pallete.background,
          elevation: 0,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Text(
                'Challenger ',
                style: TextStyle(
                    color: Pallete.lightGrey,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: [
              // ignore: prefer_const_constructors
              TextField(
                onSubmitted: (searchText) => {
                  if (searchText.trim() == '')
                    {context.read<ItemsCubit>().fetchItems(null)}
                  else
                    {
                      {context.read<ItemsCubit>().fetchItems(searchText)}
                    }
                },
                style: const TextStyle(
                  color: Pallete.white,
                  fontSize: 14,
                ),
                cursorColor: Pallete.white,
                decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Pallete.white,
                      size: 20,
                    ),
                    hintText: 'Search',
                    hintStyle:
                        TextStyle(color: Pallete.lightPurple, fontSize: 14),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Pallete.white)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: Pallete.lightPurple))),
              ),
              const SizedBox(
                height: 16,
              ),
              BlocBuilder<ItemsCubit, ItemsState>(
                builder: (context, state) {
                  if (state is ItemsInitial) {
                    // ignore: prefer_const_constructors
                    return Text("News",
                        style: const TextStyle(
                            color: Pallete.lightGrey,
                            fontSize: 20,
                            fontWeight: FontWeight.bold));
                  } else if (state is ItemsInitialSearch) {
                    // ignore: prefer_const_constructors
                    return Text("Searched News",
                        style: const TextStyle(
                            color: Pallete.lightGrey,
                            fontSize: 20,
                            fontWeight: FontWeight.bold));
                  } else {
                    return const SizedBox();
                  }
                },
              ),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                child: BlocBuilder<ItemsCubit, ItemsState>(
                  builder: (context, state) {
                    if (state is ItemsInitial) {
                      return ListView.builder(
                          itemCount: state.items.length,
                          itemBuilder: (context, index) {
                            return ItemsCard(itemsInfo: state.items[index]);
                          });
                    } else if (state is ItemsInitialSearch) {
                      return ListView.builder(
                          itemCount: state.items.length,
                          itemBuilder: (context, index) {
                            return ItemsCard(itemsInfo: state.items[index]);
                          });
                    } else if (state is ItemsLoading) {
                      return const Center(
                          child:
                              CircularProgressIndicator(color: Pallete.white));
                    } else {
                      return const Center(child: Text('Error'));
                    }
                  },
                ),
              )
            ],
          ),
        ));
  }
}
