// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

// Project imports:
import 'package:scaler/app.dart';
import 'package:scaler/app_providers.dart';
import 'package:scaler/core/di/injection_container.dart' as di;

/// The entry point of the application.
///
/// This function initializes the Flutter framework, sets up dependency
/// injection, retrieves the application's documents directory for storage,
/// and initializes the `HydratedBloc` for state management. Finally, it
/// runs the app wrapped in the `AppProviders` widget to provide necessary
/// dependencies throughout the app.
late Directory _appDocsDir;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the dependency injection setup.
  await di.init();

  // Retrieve the application's documents directory for storage purposes.
  _appDocsDir = await getApplicationDocumentsDirectory();

  // Initialize the HydratedBloc storage with the application's documents directory.
  HydratedBloc.storage =
      await HydratedStorage.build(storageDirectory: _appDocsDir);

  // Run the application, providing the necessary providers for state management.
  runApp(const AppProviders(App()));
}
