abstract class GermanyStates {}

class GermanyStateInitial extends GermanyStates {}

class GermanyStateLoading extends GermanyStates {}

class GermanyStateSuccess extends GermanyStates {}

class GermanyStateError extends GermanyStates
{
  final error;

  GermanyStateError(this.error);

}