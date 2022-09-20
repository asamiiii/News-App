import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import '../Shared_Components.dart';
import '../cubit/cubit.dart';
import '../cubit/state.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //print(list.isNotEmpty ? list[1]['title'] : 'Error');
    List<dynamic> list = NewsCubit.get(context).business;

    return BlocConsumer<NewsCubit, NewsAppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          List<dynamic> list = NewsCubit.get(context).business;

          return ConditionalBuilder(
              condition: list.isNotEmpty,
              builder: (context) => ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: ((context, index) =>
                      buildArticlesNews(list[index], context)),
                  separatorBuilder: (context, index) => devider(),
                  itemCount: list.length),
              fallback: (context) => const Center(
                    child: CircularProgressIndicator(),
                  ));
        });
  }
}
