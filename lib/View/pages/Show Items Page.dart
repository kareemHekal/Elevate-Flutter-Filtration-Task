import 'package:elevate_flutter_filtration_task/bloc/items_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loader_overlay/loader_overlay.dart';
import '../../bloc/items_state.dart';
import '../cards/ItemWidget.dart';
import '../loadingFiles/loadingWidget.dart';

class ShowItemsPage extends StatelessWidget {
  const ShowItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoaderOverlay(
        child: BlocProvider(
          create: (context) => ItemCubit()..fetchItems(),
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              iconTheme: const IconThemeData(
                color: Colors.white,
                size: 30,
              ),
              toolbarHeight: 100,
              centerTitle: true,
              backgroundColor: Colors.blue[400],
              title: Text(
                '''  M Y 
          I T E M S''',
                style: GoogleFonts.reggaeOne(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
            body: BlocBuilder<ItemCubit, ItemState>(
              builder: (context, state) {
                if (state is ItemLoading) {
                  return Center(
                    child: DiscreteCircle(
                      color: Colors.blue[400] ?? Colors.blue,
                      size: 30,
                      secondCircleColor: Colors.grey,
                      thirdCircleColor: Colors.white,
                    ),
                  );
                } else if (state is ItemLoaded) {
                  final items = state.items;
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 300,
                      crossAxisCount: 2,
                    ),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return ItemWidget(
                        item: item,
                      );
                    },
                  );
                } else if (state is ItemError) {
                  return Center(child: Text(state.message));
                }
                return const SizedBox();
              },
            ),
          ),
        ),
      ),
    );
  }
}
