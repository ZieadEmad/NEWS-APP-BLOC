abstract class JapanStates {}

class JapanStateInitial extends JapanStates {}

class JapanStateLoading extends JapanStates {}

class JapanStateSuccess extends JapanStates {}

class JapanStateError extends JapanStates
{
  final error;

  JapanStateError(this.error);

}