import 'package:delimeals/screens/category_meals_screen.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget{
  final String  title ;
  final Color color;
  final String id ;

  const CategoryItem(this.id, this.title, this.color, {super.key});
  void selectCategory(BuildContext context){
    Navigator.of(context).pushNamed('/category-meals',arguments: {'id':id,'title':title});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () =>selectCategory(context) ,
      splashColor: Colors.black38,
      borderRadius: BorderRadius.circular(15),
      child: Container(
          padding: const EdgeInsets.all(15),
          decoration:  BoxDecoration(gradient: LinearGradient(
            colors: [color.withOpacity(0.7),color],
            begin: Alignment.topLeft,
            end:Alignment.bottomRight
          ),
          borderRadius: BorderRadius.circular(15)),
          child: Text(title,style: Theme.of(context).textTheme.titleSmall,),
      ),
    );
  }}