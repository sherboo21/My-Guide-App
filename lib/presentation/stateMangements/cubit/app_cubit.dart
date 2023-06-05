import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<int> {
  AppCubit() : super(0);

  // update index function to update the index onTap in list //

  void updateIndex(int index) => emit(index);
}
