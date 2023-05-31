// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:howabout_coffee/app/data/models/client_model.dart';
import 'package:match/match.dart';

part 'wallet_state.g.dart';

@match
enum WalletStatus { initial, loading, loaded, error, clientLoaded }

class WalletState extends Equatable {
  final ClientModel? client;
  final WalletStatus status;
  final String? errorMessage;
  const WalletState({
    required this.status,
    this.client,
    this.errorMessage,
  });

  const WalletState.initial()
      : status = WalletStatus.initial,
        client = null,
        errorMessage = '';

  @override
  List<Object?> get props => [status, errorMessage, client];

  WalletState copyWith({
    ClientModel? client,
    WalletStatus? status,
    String? errorMessage,
  }) {
    return WalletState(
      client: client ?? this.client,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
