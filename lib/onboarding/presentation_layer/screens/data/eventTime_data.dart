class EventTimeUpOption {
  final String id;
  final String title;

  EventTimeUpOption({
    required this.id,
    required this.title,
  });
}
final List<EventTimeUpOption> EventTimeUpOptions=[
  EventTimeUpOption(
      id: 'In less than a months',
      title: "In less than a months"
  ),
  EventTimeUpOption(
      id: 'In less than 3 months',
      title: "In less than 3 months"
  ),
  EventTimeUpOption(
      id: 'In less than 6 months',
      title: "In less than 6 months"
  ),
  EventTimeUpOption(
      id: 'In more than 6 months',
      title: "In more than 6 months"
  ),
  EventTimeUpOption(
      id: "I'm not sure",
      title: "I'm not sure"
  ),
];