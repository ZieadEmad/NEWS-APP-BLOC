abstract class WhatsNewStates {}

class WhatsNewStateInitial extends WhatsNewStates {}

class WhatsNewStateLoading extends WhatsNewStates {}

class WhatsNewStateSuccess extends WhatsNewStates {}

class WhatsNewStateError extends WhatsNewStates
{
  final error;

  WhatsNewStateError(this.error);

}