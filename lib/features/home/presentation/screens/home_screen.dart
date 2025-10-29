import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stat_doctor/core/widgets/custom_animation_loading.dart';
import 'package:stat_doctor/features/home/presentation/cubit/location_cubit.dart';
import 'package:stat_doctor/features/home/presentation/screens/active_home_screen.dart';
import 'package:stat_doctor/features/home/presentation/screens/location_permission_denied_screen.dart';
import 'package:stat_doctor/features/home/presentation/screens/location_service_disabled_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<LocationCubit>().startGetCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LocationCubit, LocationState>(
        buildWhen: (previous, current) => current is GetCurrentLocationLoaded || current is LocationPermissionDenied || current is LocationServiceDisabled,
        builder: (context, state) {
          if(state is GetCurrentLocationLoaded) {
            return ActiveHomeScreen(position: state.position);
          } else if(state is LocationPermissionDenied) {
            return LocationPermissionDeniedScreen();
          } else if(state is LocationServiceDisabled) {
            return LocationServiceDisabledScreen();
          }
          return CustomAnimationLoading(color: Theme.of(context).scaffoldBackgroundColor);
        },
      ),
    );
  }
}