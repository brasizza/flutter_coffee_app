// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:match/match.dart';

part 'location_state.g.dart';

@match
enum LocationStatus { initial, loading, loaded, error, locationChanged }

class LocationState extends Equatable {
  final LocationStatus status;
  final Position? position;
  final String? errorMessage;
  const LocationState({
    required this.status,
    this.position,
    this.errorMessage,
  });

  const LocationState.initial()
      : status = LocationStatus.initial,
        position = null,
        errorMessage = '';

  @override
  List<Object?> get props => [status, position, errorMessage];

  LocationState copyWith({
    LocationStatus? status,
    Position? position,
    String? errorMessage,
  }) {
    return LocationState(
      status: status ?? this.status,
      position: position ?? this.position,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
