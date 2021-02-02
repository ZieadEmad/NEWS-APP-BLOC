abstract class HeadNewStates {}

class HeadNewStateInitial extends HeadNewStates {}

class HeadNewStateLoading extends HeadNewStates {}

class HeadNewStateSuccess extends HeadNewStates {}

class HeadNewStateError extends HeadNewStates
{
  final error;

  HeadNewStateError(this.error);

}