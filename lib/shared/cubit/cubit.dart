import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:projects/shared/network/local/cach_helper.dart';
import 'package:projects/states.dart';
import 'package:sqflite/sqflite.dart';

import '../../constants.dart';
import '../../modules/todo_app/archived/archived_task_screen.dart';
import '../../modules/todo_app/done/done_tasks.dart';
import '../../modules/todo_app/new_tasks/new_task_screen.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit() : super(AppInitialStates());

 static AppCubit get(context)=>BlocProvider.of(context);
  int currentIndex=0;
  List<Widget>screens=
  [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen(),
  ];
  List<String>titles=
  [
    'New Tasks',
    'Done Tasks',
    'Archived Tasks',
  ];
  void changeIndex(int index){
  currentIndex=index;
  emit(AppChangeBottomNavBarState());
  }
  late Database database;
  List<Map>tasks=[];
  void creatDatabase()
  {
     openDatabase(
      'todo.db',
      version: 1,
      onCreate:(database,version)
      {
        print('database is created');
        database.execute('CREATE TABLE tasks(id INTEGER PRIMARY KEY,title TEXT,date TEXT,time TEXT,status TEXT)').then((value)
        {
          print('table is created');
        }).catchError((error){
          print('error when create Table ${error.toString()}');
        });
      },
      onOpen:(database)
      {
        getDataBase(database).then((value){

          // setState(() {
           tasks=value;
           emit(AppGetDateBaseState());
          // });
        });
        print('database is opened');
      },
    ).then((value){
      database=value;
      emit(AppCreateDateBaseState());
     });
  }
  Future insertToDatabase(
      {
        required String title,
        required String time,
        required String date,

      })async
  {
     await database.transaction((txn){
      return  txn.rawInsert(
          'INSERT INTO tasks(title,date,time,status VALUES("$title","$date","$time","new")'
      ).then((value)
      {
        print('$value inserted successfully');
        emit(AppInsertDateBaseState());
      }).catchError((error){
        print('error when inserted row in Table ${error.toString()}');
      });

    });
  }
  Future<List<Map>> getDataBase(database)async
  {
    emit(AppGetDateBaseLoadingState());
    return  await database.rawQuery('SELECT * FROM tasks');
  }
  bool isDark=false;
  void changeDarkMode({bool? formShared}){
    if(formShared!=null){
      isDark=formShared;
    }
    else
    isDark =!isDark;
    CacheHelper.putBoolean(key: 'isDark', value:isDark).then((value){
    emit(AppChangeModeState());
  });
        }

}


