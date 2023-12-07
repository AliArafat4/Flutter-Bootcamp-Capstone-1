abstract class NavigationState {}

final class NavigationInitialState extends NavigationState {
   final int indexPage;

  NavigationInitialState({required this.indexPage});
}

