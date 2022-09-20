import 'package:flutter/material.dart';
import 'package:news_app/Network/dioHelper.dart';
import 'package:news_app/Shared_Components.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/state.dart';
import 'package:news_app/screens/search_screen.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsAppStates>(
      builder: ((context, state) {
        var cubit = NewsCubit.get(context);
        var cubitt = ThemeCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text("News App"),
            actions: [
              IconButton(
                  onPressed: () {
                    navigateTo(context, SearchScreen());
                  },
                  icon: const Icon(Icons.search)),
              IconButton(
                  onPressed: () {
                    cubitt.changeMode();
                  },
                  icon: const Icon(Icons.brightness_4_outlined))
            ],
          ),
          body: cubit.togleScreens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.bottomNavLis,
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeIndex(index);
            },
            type: BottomNavigationBarType.fixed,
            fixedColor: Colors.amber,
          ),
        );
      }),
      listener: (context, state) {},
    );
  }
}
