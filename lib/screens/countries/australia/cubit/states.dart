abstract class AustraliaStates {}

class AustraliaStateInitial extends AustraliaStates {}

class AustraliaStateLoading extends AustraliaStates {}

class AustraliaStateSuccess extends AustraliaStates {}

class AustraliaStateError extends AustraliaStates
{
  final error;

  AustraliaStateError(this.error);

}