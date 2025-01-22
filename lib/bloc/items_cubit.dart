import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/Items Respoce Model.dart';
import 'items_state.dart';

class ItemCubit extends Cubit<ItemState> {
  ItemCubit() : super(ItemInitial());

  Future<void> fetchItems() async {
    emit(ItemLoading());
    try {
      final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        final items = jsonData.map((json) => ItemsRespoceModel.fromJson(json)).toList();
        emit(ItemLoaded(items));
      } else {
        emit(ItemError('Failed to load items. Status code: ${response.statusCode}'));
      }
    } catch (e) {
      print(e);
      emit(ItemError('An error occurred: $e'));
    }
  }
}
