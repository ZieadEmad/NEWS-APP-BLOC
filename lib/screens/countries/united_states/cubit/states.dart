abstract class UnitedStatesStates {}

class UnitedStatesInitial extends UnitedStatesStates {}

class UnitedStatesLoading extends UnitedStatesStates {}

class UnitedStatesSuccess extends UnitedStatesStates {}

class UnitedStatesError extends UnitedStatesStates
{
  final error;

  UnitedStatesError(this.error);

}