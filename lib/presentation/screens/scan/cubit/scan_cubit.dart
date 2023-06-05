import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_guide/domain/repositories/scan_repository.dart';

import '../../../../utils/app_strings.dart';

part 'scan_state.dart';

class ScanCubit extends Cubit<ScanState> {
  ScanCubit() : super(ScanInitial());

  ScanRepository scanRepository = ScanRepository();

  // scan blind id Cubit //

  void scanBlindId({required int id}) async {
    await scanRepository.scanBlindId(
        emit: emit,
        loadingState: ScanBlindIdLoading(),
        successState: ScanBindSuccess(),
        errorState: ScanBlindError(messageError: AppStrings.anErrorOccurred),
        id: id);
  }
}
