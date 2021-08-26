
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects/components.dart';
import 'package:projects/layout/shop_app/shop_cubit.dart';
import 'package:projects/layout/shop_app/states.dart';
import 'package:projects/models/shop_app/categories_model.dart';
class CateogriesScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (contetx,state){},
      builder: (context,state){
        return ListView.separated(
          itemBuilder:(context,index)=>buildCatItem(ShopCubit.get(context).categoriesModel.data.data[index]),
          separatorBuilder:(context,index)=>myDiver() ,
          itemCount:ShopCubit.get(context).categoriesModel.data.data.length,);
      },
    );
  }

  Widget buildCatItem(DataModel model)=>Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Image(
          image:NetworkImage(model.image),
          height: 80,
          width: 80,
          fit: BoxFit.cover,
        ),
        SizedBox(
          width: 20.0,
        ),
        Text(
          model.name,
          style:TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
        Icon(
          Icons.arrow_forward_ios,
        ),
      ],
    ),
  );
}







// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:projects/components.dart';
// import 'package:projects/layout/shop_app/cubit/shop_cubit.dart';
// import 'package:projects/layout/shop_app/cubit/states.dart';
// import 'package:projects/models/shop_app/categories_model.dart';
//
// class CateogriesScreen extends StatelessWidget {
//
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<ShopCubit,ShopStates>(
//       listener: (context,state){},
//       builder: (context,state){
//         return ListView.separated(
//             itemBuilder: (context,index)=>buildCatItem(ShopCubit.get(context).cateogriesModel.data.data[index]),
//             separatorBuilder: (context,index)=>myDiver(),
//             itemCount: ShopCubit.get(context).cateogriesModel.data.data.length );
//       },
//
//     );
//   }
//   Widget buildCatItem(DataModel model)=> Padding(
//     padding: const EdgeInsets.all(20.0),
//     child: Row(
//       children: [
//         Image(
//           image:NetworkImage(model.image),
//           width: 80.0,
//           height: 80.0,
//           fit: BoxFit.cover,
//         ),
//         SizedBox(
//           width: 20.0,
//         ),
//         Text(
//           model.name,
//           style:TextStyle(
//             fontSize: 20.0,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         Spacer(),
//         Icon(
//           Icons.arrow_forward_ios,
//         ),
//       ],
//     ),
//   );
// }