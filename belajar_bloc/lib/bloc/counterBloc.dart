import 'package:bloc/bloc.dart';

class counter extends Cubit<int> {
  counter({this.initialData = 0}) : super(initialData);

  // Kalau mau custom
  int initialData;

  void tambahData() {
    emit(state + 1);
  }

  void kurangData() {
    if (state <= 0) {
      emit(state);
    } else {
      emit(state - 1);
    }
  }

  // Fitur Bloc untuk memantau data
  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    print(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print(error);
  }
}
