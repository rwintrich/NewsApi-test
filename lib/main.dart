import 'package:challenger_flutter_deloitte/core/constants/pallete.dart';
import 'package:challenger_flutter_deloitte/core/services_locator.dart';
import 'package:challenger_flutter_deloitte/features/show_items/presentation/items_cubit/items_cubit.dart';
import 'package:challenger_flutter_deloitte/features/show_items/presentation/pages/home_page.dart';
import 'package:challenger_flutter_deloitte/features/show_items/presentation/pages/item_view_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized;
  setUpServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) {
            return ItemsCubit();
          })
        ],
        child: MaterialApp(
          title: 'Challenger List',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            colorScheme: const ColorScheme.light()
                .copyWith(secondary: Pallete.purpleDarken2),
          ),
          home: const HomePage(),
        ));
  }
}
