import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Shared_Components.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/state.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  TextEditingController searchController = TextEditingController(text:"");

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsAppStates>(
      //key:const Key('aaa') ,
      listener: (context, state) {},
      builder: (context, state) {
        var searchList = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(
            title: const Text("Search"),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  onChanged: (value) => NewsCubit.get(context).getSearch(value),
                  decoration: const InputDecoration(
                      labelText: 'Search',
                      prefixIcon: Icon(Icons.search_rounded)),
                  controller: searchController,
                  keyboardType: TextInputType.text,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Search must be not empty';
                    }
                    return null;
                  },
                ),
              ),searchList.isNotEmpty?
              Expanded(
                child: ListView.separated(
                  key: const Key('search'),
                  itemBuilder: ((context, index) => (buildArticlesNews(searchList[index], context)
                
                  )),
                   itemCount: searchList.length,
                    separatorBuilder: (BuildContext context, int index) {return devider();},),
              ):

                  const Center(
                    child: Text(
                      'No Current data , Please search to get some Articles',
                      style: TextStyle(fontSize: 20),
                      
                      ),
                  )
            
          ],
        ));
      }
    );
  }
}
