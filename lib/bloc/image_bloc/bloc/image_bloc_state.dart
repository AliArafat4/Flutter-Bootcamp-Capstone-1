part of 'image_bloc_bloc.dart';

@immutable
sealed class ImageBlocState {}

final class ImageBlocInitial extends ImageBlocState {}

final class ImageLoading extends ImageBlocState {}

final class ImageSuccess extends ImageBlocState {
  final String? image;

  ImageSuccess({required this.image});
}

final class SuccessUpladImage extends ImageBlocState {}
