class FeelWakeUpOption {
  final String id;
  final String title;

  FeelWakeUpOption({
    required this.id,
    required this.title,
  });
}
final List<FeelWakeUpOption> FeelWakeUpOptions=[
  FeelWakeUpOption(
      id: 'Refreshed',
      title: "Refreshed and energized"
  ),
  FeelWakeUpOption(
      id: 'little_tired',
      title: "A little tired ,but ready to start the day"
  ),
  FeelWakeUpOption(
      id: 'very_tired',
      title: "Very tired and in need of energy boost"
  ),
  FeelWakeUpOption(
      id: 'Exhausted',
      title: "Exhausted and struggling to get going"
  ),
];