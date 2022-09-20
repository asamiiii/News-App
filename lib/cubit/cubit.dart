import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Local/CashHelper.dart';
import 'package:news_app/cubit/state.dart';
import 'package:news_app/screens/Science.dart';
import 'package:news_app/screens/business.dart';
import 'package:news_app/screens/settings.dart';
import 'package:news_app/screens/sports.dart';

import '../Network/dioHelper.dart';

class NewsCubit extends Cubit<NewsAppStates> {
  NewsCubit() : super(InitialAppState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  bool isDark = true;

  late List<dynamic> business = [];
  late List<dynamic> sports = [];
  late List<dynamic> scince = [];
  late List<dynamic> search = [];

  List<Widget> togleScreens = const [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    SettingsScreen()
  ];

  List<BottomNavigationBarItem> bottomNavLis = const [
    BottomNavigationBarItem(
        icon: Icon(Icons.business_center_outlined), label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'science'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Settings'),
  ];

  changeIndex(int index) {
    currentIndex = index;
    if (index == 1) {
      getSports();
    }
    if (index == 2) {
      getScince();
    }
    emit(BottomNavState());
  }

  void getBusiness() {
    emit(NewsBusinessLoadingState());

    if (business.isEmpty) {
      DioHelper.getData(url: '/v2/top-headlines', query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': '04c648f0ecc84749a8cb8db573e52492'
      }).then((value) {
        //print(value.data['articles'][0]['title'].toString()))

        business = value.data['articles'];
        emit(GetNewsBusinessState());
        //print(business[5]['title']);
      }).catchError((error) {
        emit(NewsBusinessErrorState(error));
        print(error.toString());
      });
    } else {
      emit(GetNewsBusinessState());
    }
  }

  void getSports() {
    emit(NewsSportsLoadingState());

    if (sports.isEmpty) {
      DioHelper.getData(url: '/v2/top-headlines', query: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': '04c648f0ecc84749a8cb8db573e52492'
      }).then((value) {
        //print(value.data['articles'][0]['title'].toString()))

        sports = value.data['articles'];
        emit(GetNewsSportsState());
        //print(business[5]['title']);
      }).catchError((error) {
        emit(NewsSportsErrorState(error));
        print(error.toString());
      });
    } else {
      emit(GetNewsSportsState());
    }
  }

  void getScince() {
    emit(NewsScinceLoadingState());
    if (scince.isEmpty) {
      DioHelper.getData(url: '/v2/top-headlines', query: {
        'country': 'eg',
        'category': 'science',
        'apiKey': '04c648f0ecc84749a8cb8db573e52492'
      }).then((value) {
        //print(value.data['articles'][0]['title'].toString()))

        scince = value.data['articles'];
        emit(GetNewsScinceState());
        //print(business[5]['title']);
      }).catchError((error) {
        emit(NewsScinceErrorState(error));
        print(error.toString());
      });
    } else {
      emit(GetNewsScinceState());
    }
  }

  void getSearch(String searchText) {
    
    
     emit(NewsSearchLoadingState());
     search = [];
    DioHelper.getData(url: '/v2/everything', query: {
      'q': '$searchText',
      'apiKey': '04c648f0ecc84749a8cb8db573e52492'
    }).then((value) {
      //print(value.data['articles'][0]['title'].toString());

      search = value.data['articles'];
      emit(GetSearchState());

     // print(searchText[2].toString());
    }).catchError((error) {
      emit(NewsSearchErrorState(error));
      print(error.toString());
    });
  }
}

class ThemeCubit extends Cubit<NewsAppStates> {
  ThemeCubit() : super(InitialAppState());

  static ThemeCubit get(context) => BlocProvider.of(context);

  bool isDark = true;

  void changeMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(DarkState());
    } else {
      isDark = !isDark;
      CasheHelper.putBool(key: 'isDark', value: isDark).then((value) {
        emit(DarkState());
      });
    }
  }
}
