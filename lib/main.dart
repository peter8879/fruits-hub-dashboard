import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/helper_functions/on_generate_routes.dart';
import 'package:fruit_hub_dashboard/core/services/get_it__service.dart';
import 'package:fruit_hub_dashboard/core/services/supabase_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/services/custom_bloc_observer.dart';
import 'features/dashboard/presentation/views/dashboard_view.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SupabaseStorageService.init();
  await SupabaseStorageService.createBucket('fruits_images');
  setup();
  Bloc.observer = CustomBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      onGenerateRoute: onGenerateRoute,
      initialRoute: DashboardView.routeName,
      debugShowCheckedModeBanner: false,

    );
  }
}


