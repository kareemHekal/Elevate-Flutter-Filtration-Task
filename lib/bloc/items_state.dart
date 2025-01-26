import '../model/Items Respoce Model.dart';

abstract class ItemState {}

class ItemInitial extends ItemState {}

class ItemLoading extends ItemState {}

class ItemLoaded extends ItemState {
  final List<ItemsRespoceModel> items;

  ItemLoaded(this.items);
}

class ItemError extends ItemState {
  final String message;

  ItemError(this.message);
}
