import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scaler/core/di/injection_container.dart';
import 'package:scaler/features/jobs/bloc/job_bloc.dart';

/// A widget that provides the necessary dependencies and state management
/// for the application using the BLoC pattern. It wraps the given child
/// widget with a `MultiBlocProvider`, allowing access to various BLoCs
/// throughout the widget tree. In this case, it initializes the `JobBloc`
/// with a dependency injection service and triggers the `GetJobList` event.
///
/// This is primarily used for blocs that are hard to scope.
class AppProviders extends StatelessWidget {
  const AppProviders(
    this.child, {
    super.key,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: false,
          create: (context) => JobBloc(sl())..add(const GetJobList()),
        ),
      ],
      child: child,
    );
  }
}
