
import 'package:equatable/equatable.dart';

class SimilarShift extends Equatable {
  final String date;
  final String rate;

  const SimilarShift({
    required this.date,
    required this.rate,
  });

  SimilarShift copyWith({String? date, String? rate}) {
    return SimilarShift(date: date ?? this.date, rate: rate ?? this.rate);
  }

  @override
  List<Object?> get props => [date, rate];
}
