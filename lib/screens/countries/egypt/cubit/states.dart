abstract class EgyptStates {}

class EgyptStateInitial extends EgyptStates {}

class EgyptStateLoading extends EgyptStates {}

class EgyptStateSuccess extends EgyptStates {}

class EgyptStateError extends EgyptStates
{
  final error;

  EgyptStateError(this.error);

}