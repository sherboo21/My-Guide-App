import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_guide/domain/models/book.dart';
import 'package:my_guide/domain/models/categories.dart';
import 'package:my_guide/utils/app_strings.dart';

import '../../../../../domain/models/book_details.dart';
import '../../../../../domain/repositories/audio_book_repository.dart';

part 'audio_book_state.dart';

class AudioBookCubit extends Cubit<AudioBookState> {
  AudioBookCubit() : super(AudioBookInitial());
  AudioBookRepository audioBookRepository = AudioBookRepository();

  // Data Models //
  CategoriesDataModel categoriesDataModel = CategoriesDataModel();
  BookDetailsDataModel bookDetailsDataModel = BookDetailsDataModel();
  BooksDataModel booksDataModel = BooksDataModel();

  // get categories cubit //

  getCategories() async {
    categoriesDataModel = await audioBookRepository.getCategories(
        emit: emit,
        successState:
            GetCategoriesSuccess(categoriesDataModel.message.toString()),
        loadingState: GetCategoriesLoading(),
        errorState:
            GetCategoriesError(messageError: AppStrings.anErrorOccurred));
  }

  // get category book cubit //

  getCategoryBook({required int id}) async {
    booksDataModel = await audioBookRepository.getCategoryBook(
        emit: emit,
        successState: GetCategoryBookSuccess(booksDataModel.message.toString()),
        loadingState: GetCategoryBookLoading(),
        errorState:
            GetCategoryBookError(messageError: AppStrings.anErrorOccurred),
        id: id);
  }

  // get book details cubit //

  getBookDetails({required int id}) async {
    bookDetailsDataModel = await audioBookRepository.getBookDetails(
        emit: emit,
        successState: GetBookDetailsSuccess(booksDataModel.message.toString()),
        loadingState: GetBookDetailsLoading(),
        errorState:
            GetBookDetailsError(messageError: AppStrings.anErrorOccurred),
        id: id);
  }
}
