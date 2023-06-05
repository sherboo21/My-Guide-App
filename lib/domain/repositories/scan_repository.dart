import 'package:my_guide/data/repositoriesImpl/scan_repository_impl.dart';
import 'package:my_guide/presentation/screens/scan/cubit/scan_cubit.dart';

class ScanRepository {
  ScanRepositoryImpl scanRepositoryImpl = ScanRepositoryImpl();

  // scan blind id repository //

  Future<dynamic> scanBlindId(
      {required void Function(ScanState) emit,
      required ScanState successState,
      loadingState,
      errorState,
      required int id}) async {
    dynamic data = await scanRepositoryImpl.scanBlindId(
        emit: emit,
        successState: successState,
        loadingState: loadingState,
        errorState: errorState,
        id: id);
    return data;
  }
}
