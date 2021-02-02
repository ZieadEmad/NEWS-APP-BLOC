abstract class FranceStates {}

class FranceStateInitial extends FranceStates {}

class FranceStateLoading extends FranceStates {}

class FranceStateSuccess extends FranceStates {}

class FranceStateError extends FranceStates
{
  final error;

  FranceStateError(this.error);

}