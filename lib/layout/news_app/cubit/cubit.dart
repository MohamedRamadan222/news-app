import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/news_app/cubit/states.dart';
import 'package:untitled/modules/business/business_screen.dart';
import 'package:untitled/modules/science/science_screen.dart';
import 'package:untitled/modules/sports/sports_screen.dart';

import '../../../shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'science',
    ),
    // BottomNavigationBarItem(
    //   icon: Icon(Icons.settings),
    //   label: 'Settings',
    // ),
  ];
  List<Widget> screen = [
    const BusinessScreen(),
    SportsScreen(),
    const ScienceScreen(),
    // SettingsScreen(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    if (index == 1) getSports();
    if (index == 2) getScience();
    emit(NewsBottomNavState());
  }

  List<dynamic> business = [];

  void getBusiness() {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(
            url: 'https://wsq-api.fonoq.com/api/v1/articles',
            query: {'search': ''})
        .then((value) => {
              // print(value.data.toString()),
              business = value.data['data'],
              print(business[0]),
              emit(NewGetBusinessSuccessState())
            })
        .catchError((error) {
      emit(NewGetBusinessErrorState(error.toString()));
    });
  }

  List<dynamic> sports = [];

  void getSports() {
    emit(NewsGetBusinessLoadingState());
    if (sports.length == 0) {
      DioHelper.getData(
              url: 'https://wsq-api.fonoq.com/api/v1/articles',
              query: {'search': ''})
          .then((value) => {
                // print(value.data.toString()),
                sports = value.data['data'],
                print(sports[0]),
                emit(NewGetSportsSuccessState())
              })
          .catchError((error) {
        emit(NewGetSportsErrorState(error.toString()));
      });
    } else {
      emit(NewGetSportsSuccessState());
    }
  }

  List<dynamic> science = [];

  void getScience() {
    emit(NewsGetScienceLoadingState());
    if (science.isEmpty) {
      DioHelper.getData(
              url: 'https://wsq-api.fonoq.com/api/v1/articles',
              query: {'search': ''})
          .then((value) => {
                // print(value.data.toString()),
                science = value.data['data'],
                print(science[0]),
                emit(NewGetScienceSuccessState())
              })
          .catchError((error) {
        emit(NewGetScienceErrorState(error.toString()));
      });
    } else {
      emit(NewGetScienceSuccessState());
    }
  }

  List<dynamic> search = [];

  void getSearch(String value) {
    emit(NewsGetSearchLoadingState());
    // search =[];
    DioHelper.getData(
            url: 'https://wsq-api.fonoq.com/api/v1/articles',
            query: {'search': value})
        .then((value) => {
              search = value.data['data'],
              emit(NewGetSearchSuccessState())
            })
        .catchError((error) {
      emit(NewGetSearchErrorState(error.toString()));
    });
  }
}
