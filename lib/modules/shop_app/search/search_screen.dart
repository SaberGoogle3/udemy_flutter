  import 'package:flutter/material.dart';
  import 'package:flutter_bloc/flutter_bloc.dart';
  import 'package:projects/components.dart';

  import 'package:projects/modules/shop_app/search/cubit/states.dart';

import 'cubit/cubit.dart';



  class SearchScreen extends StatelessWidget {
  var formKey=GlobalKey<FormState>();
  var searchController=TextEditingController();
    @override
    Widget build(BuildContext context) {
      return BlocProvider(
        create: (BuildContext context)=>SearchCubit(),
        child:BlocConsumer<SearchCubit,SearchStates>(
          listener: (context,state){},
          builder: (context,state)
          {
            return Scaffold(
              appBar:AppBar(),
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children:
                  [
                    defaultFormFeild(
                        controller: searchController,
                        type: TextInputType.text,
                        validate:(String value)
                        {
                          if(value.isEmpty){
                            return 'enter text to search';
                          }
                          return null;
                        },
                      onFieldSubmit: (String value)
                      {
                        SearchCubit.get(context).search(value);
                      },
                        label: 'Search',
                        prefix: Icons.search,),
                    SizedBox(
                      height: 10,
                    ),
                    if(state is SearchLoadingState)
                      LinearProgressIndicator(),
                    SizedBox(
                      height: 10,
                    ),
                    if(state is SearchSuccessState)
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context,index)=> buildListProduct(SearchCubit.get(context).model.data.data[index],context,isOldPrice:false,),
                        separatorBuilder: (context,index)=>myDiver(),
                        itemCount: SearchCubit.get(context).model.data.data.length, ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    }
  }






