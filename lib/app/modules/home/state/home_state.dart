// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:howabout_coffee/app/data/models/client_model.dart';
import 'package:match/match.dart';

part 'home_state.g.dart';

@match
enum HomeStatus { initial, loading, loaded, error, clientLoaded }

class HomeState extends Equatable {
  final HomeStatus status;
  final ClientModel? client;
  final String? errorMessage;

  const HomeState({required this.status, this.client, this.errorMessage});

  const HomeState.initial()
      : status = HomeStatus.initial,
        errorMessage = '',
        client = null;

  @override
  List<Object?> get props => [status, client, errorMessage];

  HomeState copyWith({
    HomeStatus? status,
    ClientModel? client,
    String? errorMessage,
  }) {
    return HomeState(
      status: status ?? this.status,
      client: client ?? this.client,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
