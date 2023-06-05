part of 'audio_book_cubit.dart';

abstract class AudioBookState extends Equatable {
  const AudioBookState();

  @override
  List<Object?> get props => [];
}

class AudioBookInitial extends AudioBookState {}

// get categories state //

class GetCategoriesLoading extends AudioBookState {}

class GetCategoriesSuccess extends AudioBookState {
  final dynamic data;

  const GetCategoriesSuccess(this.data);

  @override
  List<Object?> get props => [data];
}

class GetCategoriesError extends AudioBookState {
  final String messageError;

  const GetCategoriesError({required this.messageError});

  @override
  List<Object?> get props => [messageError];
}

// get category book state //

class GetCategoryBookLoading extends AudioBookState {}

class GetCategoryBookSuccess extends AudioBookState {
  final dynamic data;

  const GetCategoryBookSuccess(this.data);

  @override
  List<Object?> get props => [data];
}

class GetCategoryBookError extends AudioBookState {
  final String messageError;

  const GetCategoryBookError({required this.messageError});

  @override
  List<Object?> get props => [messageError];
}

// get book details state //

class GetBookDetailsLoading extends AudioBookState {}

class GetBookDetailsSuccess extends AudioBookState {
  final dynamic data;

  const GetBookDetailsSuccess(this.data);

  @override
  List<Object?> get props => [data];
}

class GetBookDetailsError extends AudioBookState {
  final String messageError;

  const GetBookDetailsError({required this.messageError});

  @override
  List<Object?> get props => [messageError];
}
