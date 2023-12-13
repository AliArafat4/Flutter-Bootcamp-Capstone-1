import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:team_hack/db/supabase_db.dart';

part 'image_bloc_event.dart';
part 'image_bloc_state.dart';

class ImageBloc extends Bloc<ImageBlocEvent, ImageBlocState> {
  ImageBloc() : super(ImageBlocInitial()) {
    on<AddImageEvent>((event, emit) async {
      // TODO: implement event handler

      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image == null) {
        return;
      }
      await SupaBaseDB().addImage(image);

      emit(SuccessUpladImage());
    });

    on<GetImageEvent>((event, emit) async {
      // TODO: implement event handler

      final String getImage = await SupaBaseDB().getImage();
      emit(ImageSuccess(image: getImage.toString()));
    });
  }
}
