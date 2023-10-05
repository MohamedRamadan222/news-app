import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/news_app/cubit/cubit.dart';
import '../../layout/news_app/cubit/states.dart';
import '../../shared/componentes/components.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();

  SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state){},
        builder: (context, state){
          var list = NewsCubit.get(context).search;
          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: defaultFormField(
                    controller: searchController,
                    type: TextInputType.text,
                    onChange: (value){
                      print("Test error $value");
                      NewsCubit.get(context).getSearch(value);
                    },
                    validator:(String value)
                    {
                      if(value.isEmpty){
                        return 'search must not be empty';
                      }
                      return null;
                    },
                    label: 'search',
                    prefix: Icons.search,
                  ),
                ),
                Expanded(child: articaleBuilder(list,context)),
              ],
            ),
          );
        }
    );
  }
}
