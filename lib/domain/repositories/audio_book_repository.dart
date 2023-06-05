import 'package:my_guide/data/repositoriesImpl/audio_book_repository_impl.dart';

import '../../presentation/screens/layOut/audioBook/cubit/audio_book_cubit.dart';

class AudioBookRepository {
  AudioBookRepositoryImpl audioBookRepositoryImpl = AudioBookRepositoryImpl();

  // get categories repository //

  Future<dynamic> getCategories({
    required emit,
    required AudioBookState successState,
    loadingState,
    errorState,
  }) async {
    try {
      dynamic data = await audioBookRepositoryImpl.getCategories(
        emit: emit,
        successState: successState,
        loadingState: loadingState,
        errorState: errorState,
      );
      return data;
    } catch (e) {
      rethrow;
    }
  }

  // get category book repository //

  Future<dynamic> getCategoryBook(
      {required emit,
      required AudioBookState successState,
      loadingState,
      errorState,
      required id}) async {
    try {
      dynamic data = await audioBookRepositoryImpl.getCategoryBook(
          emit: emit,
          successState: successState,
          loadingState: loadingState,
          errorState: errorState,
          id: id);
      return data;
    } catch (e) {
      rethrow;
    }
  }

  // get book details repository //

  Future<dynamic> getBookDetails(
      {required emit,
      required AudioBookState successState,
      loadingState,
      errorState,
      required id}) async {
    try {
      dynamic data = await audioBookRepositoryImpl.getBookDetails(
          emit: emit,
          successState: successState,
          loadingState: loadingState,
          errorState: errorState,
          id: id);
      return data;
    } catch (e) {
      rethrow;
    }
  }
}
