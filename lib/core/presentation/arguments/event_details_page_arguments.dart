class EventDetailsPageArguments {
  final String? eventId;
  final void Function()? eventPageRefresher;
  EventDetailsPageArguments(
      {required this.eventPageRefresher, required this.eventId});
}
