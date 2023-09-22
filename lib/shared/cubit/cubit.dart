import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/shared/cubit/states.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  void changeAppMode()
  {
    isDark = !isDark;
    emit(AppChangeBottomSheetState());
  }

}
