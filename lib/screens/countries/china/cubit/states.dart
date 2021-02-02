abstract class ChinaStates {}

class ChinaStateInitial extends ChinaStates {}

class ChinaStateLoading extends ChinaStates {}

class ChinaStateSuccess extends ChinaStates {}

class ChinaStateError extends ChinaStates
{
  final error;

  ChinaStateError(this.error);

}