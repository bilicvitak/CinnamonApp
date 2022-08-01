import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'goal.freezed.dart';

part 'goal.g.dart';

@freezed
class Goal extends Equatable with _$Goal {
  const Goal._();

  factory Goal({
    required String id,
    required String name,
    required bool isChecked,
  }) = _Goal;

  factory Goal.fromJson(Map<String, dynamic> json) => _$GoalFromJson(json);

  @override
  List<Object?> get props => [id, name, isChecked];

  @override
  bool get stringify => true;
}
