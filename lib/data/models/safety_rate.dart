import 'package:freezed_annotation/freezed_annotation.dart';

part 'safety_rate.freezed.dart';

part 'safety_rate.g.dart';

// TODO map scores to text String
/// **Get safety rating for given destination (city).**
///
/// Safety rating ranges from 0 to 100, where 0 means the best/very safe and
/// 100 score means worst/very dangerous.
///
/// Based on the score this text will be shown for each category:
/// - (0 - 12) very safe
/// - (13 - 28) safe
/// - (29 - 43) quite safe
/// - (44 - 58) neutral
/// - (59 - 73) quite dangerous
/// - (74 - 88) dangerous
/// - (88 - 100) very dangerous
@freezed
abstract class SafetyRate with _$SafetyRate {
  @Assert('subType == \'CITY\'', 'safety place is not city')
  const factory SafetyRate({
    String name,
    @required String subType,
    @required SafetyScores safetyScores,
  }) = _SafetyRate;

  factory SafetyRate.fromJson(Map<String, dynamic> json) => _$SafetyRateFromJson(json);
}

@freezed
abstract class SafetyScores with _$SafetyScores {
  const factory SafetyScores({
    @required int overall,
    int lgbtq,
    int medical,
    int physicalHarm,
    int politicalFreedom,
    int theft,
    int women,
  }) = _SafetyScores;

  factory SafetyScores.fromJson(Map<String, dynamic> json) => _$SafetyScoresFromJson(json);
}