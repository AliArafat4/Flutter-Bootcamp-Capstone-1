abstract class NavigationEvent {}

class ClickNavigationEvent extends NavigationEvent {
  final int clickIndex;

  ClickNavigationEvent({required this.clickIndex});
}
