import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:stat_doctor/core/methods/map_methods.dart';
part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  StreamSubscription? _locationServiceSubscription;
  bool permissionRequestInProgress = false;
  LocationCubit() : super(LocationInitial());

  Stream<ServiceStatus> _getLocationServiceSubscription() async* {
    yield await Geolocator.isLocationServiceEnabled().then((value) => value ? ServiceStatus.enabled : ServiceStatus.disabled);
    yield* Geolocator.getServiceStatusStream();
  }

  Future<void> startGetCurrentLocation() async {
    _locationServiceSubscription = _getLocationServiceSubscription().listen(
      (event) async{
        if(event == ServiceStatus.enabled) {
          if(!permissionRequestInProgress) {
            permissionRequestInProgress = true;
            bool granted = await MapMethods.requestLocationPermissions();
            if (!granted) {emit(LocationPermissionDenied());}
            permissionRequestInProgress = false;
            if(granted) {await _getCurrentLocation();}
          }
        } else {
          emit(LocationServiceDisabled());
        }
      },
    );
  }


  Future<void> _getCurrentLocation() async {
    try {
     emit(GetCurrentLocationLoading());
      final position  = await Geolocator.getCurrentPosition(locationSettings: MapMethods.getLocationSettings());
      emit(GetCurrentLocationLoaded(position: position)); 
    } catch (e) {
      emit(GetCurrentLocationError(message: "Something Went wrong"));
    }
  }


  @override
  Future<void> close() {     
    _locationServiceSubscription?.cancel();
    return super.close();
  }

}
