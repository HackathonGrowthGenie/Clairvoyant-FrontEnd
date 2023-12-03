abstract class ClientSelectionEvent{}


class ClientTextChangedEvent extends ClientSelectionEvent{
  final String clientIdValue;
  ClientTextChangedEvent(this.clientIdValue);
}

class ClientSubmittedEvent extends ClientSelectionEvent{
  final String clientId;
  ClientSubmittedEvent(this.clientId);
}