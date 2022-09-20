import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Shared_Components.dart';
import '../cubit/cubit.dart';
import '../cubit/state.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsAppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          List<dynamic> list = NewsCubit.get(context).sports;

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
