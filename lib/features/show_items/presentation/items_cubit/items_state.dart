part of 'items_cubit.dart';

@immutable
abstract class ItemsState {}

class ItemsInitial extends ItemsState {
  final List<ItemInfo> items;
  ItemsInitial({required this.items});
}

class ItemsInitialSearch extends ItemsState {
  final List<ItemInfo> items;
  ItemsInitialSearch({required this.items});
}

class ItemsLoading extends ItemsState {}

class ItemsError extends ItemsState {}
