 sealed class HomeState {}

class LoadingState extends HomeState {}

class LoadedState extends HomeState {
  final String data;

  LoadedState(this.data);
}

class ErrorState extends HomeState {
  final String message;

  ErrorState(this.message);
}

void main(List<String> args) {


  final HomeState state = LoadedState('data');


  switch (state) {
    case LoadingState():
      print('LoadedState');
      break;
    case LoadedState():
      print('LoadedState');
      break;
    case ErrorState():
      print('ErrorState');
      break;
  }
}