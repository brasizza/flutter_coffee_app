// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:howabout_coffee/app/data/models/client.dart';
import 'package:match/match.dart';

part 'home_state.g.dart';

@match
enum HomeStatus { initial, loading, loaded, error, clientLoaded }

class HomeState extends Equatable {
  final HomeStatus status;
  final Client? client;

  const HomeState({
    required this.status,
    this.client,
  });

  const HomeState.initial()
      : status = HomeStatus.initial,
        client = null;

  @override
  List<Object?> get props => [status, client];

  HomeState copyWith({
    HomeStatus? status,
    Client? client,
  }) {
    return HomeState(
      status: status ?? this.status,
      client: client ?? this.client,
    );
  }
}
