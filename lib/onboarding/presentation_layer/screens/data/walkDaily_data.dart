class WalkDailyOption {
  final String id;
  final String title;

  WalkDailyOption({
    required this.id,
    required this.title,
  });
}
final List<WalkDailyOption> activeOptions=[
  WalkDailyOption(
      id: 'MORE_THAN_TWO',
      title: "More than 2 hours"
  ),
  WalkDailyOption(
      id: 'BETWEEN_ONE_TWO',
      title: "1-2 hours"
  ),
  WalkDailyOption(
      id: 'LESS_THAN_TWO',
      title: "Less than 1 hour"
  ),
];