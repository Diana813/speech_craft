import 'package:equatable/equatable.dart';

class TimeRange extends Equatable {
  final double start;
  final double end;

  const TimeRange({required this.start, required this.end});

  Map<String, dynamic> toJson() {
    return {
      'start': start,
      'end': end,
    };
  }

  @override
  List<Object?> get props => [start, end];
}
