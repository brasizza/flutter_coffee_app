// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:howabout_coffee/app/data/models/promotion_model.dart';
import 'package:match/match.dart';

part 'presentation_state.g.dart';

@match
enum PresentationStatus { initial, loading, loaded, error }

class PresentationState extends Equatable {
  final PresentationStatus status;
  final List<PromotionModel> images;
  final String? errorMessage;
  const PresentationState({required this.status, required this.images, this.errorMessage});

  const PresentationState.initial()
      : status = PresentationStatus.initial,
        errorMessage = null,
        images = const [];

  @override
  List<Object> get props => [status, images];

  PresentationState copyWith({
    PresentationStatus? status,
    List<PromotionModel>? images,
    String? errorMessage,
  }) {
    return PresentationState(
      status: status ?? this.status,
      images: images ?? this.images,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
