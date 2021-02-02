abstract class CanadaStates {}

class CanadaStateInitial extends CanadaStates {}

class CanadaStateLoading extends CanadaStates {}

class CanadaStateSuccess extends CanadaStates {}

class CanadaStateError extends CanadaStates
{
  final error;

  CanadaStateError(this.error);

}