part of 'image_bloc_bloc.dart';

@immutable
sealed class ImageBlocEvent {}

class GetImageEvent extends ImageBlocEvent {}

class AddImageEvent extends ImageBlocEvent {}
