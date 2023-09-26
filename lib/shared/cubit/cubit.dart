import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/shared/cubit/states.dart';
import 'package:untitled/shared/network/local/cach_helper.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  void changeAppMode({required bool fromShared}) {
    if (!fromShared) {
      isDark = fromShared;
      emit(AppChangeBottomSheetState());
    } else {
      isDark = !isDark;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
        emit(AppChangeBottomSheetState());
    });

    }
  }
}
