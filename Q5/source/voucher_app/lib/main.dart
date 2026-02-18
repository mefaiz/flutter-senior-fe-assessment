import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'constants/app_strings.dart';
import 'constants/app_dimens.dart';
import 'data/selection_provider.dart';
import 'screens/voucher_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SelectionProvider(),
      child: MaterialApp(
        title: AppStrings.appTitle,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            scrolledUnderElevation: 0,
            surfaceTintColor: Colors.transparent,
          ),
          cardTheme: CardThemeData(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDimens.radiusLg),
            ),
          ),
        ),
        home: const VoucherListScreen(),
      ),
    );
  }
}
