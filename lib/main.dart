import 'package:flutter/material.dart';
import 'package:saberion_assessment/feature/home/presentation/page/home_page.dart';

import 'app/injection/injection.dart';
import 'app/theme/theme.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies();

  runApp(
    MaterialApp(
      theme: ThemeData(
        primaryColor: primaryColor,
      ),
      home: const HomePage(),
    ),
  );
}
