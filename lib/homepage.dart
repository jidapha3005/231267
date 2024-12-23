import 'dart:math';

import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    var rnd = Random();
    return Scaffold(
      appBar: AppBar(title: const Text('Product List'),
      centerTitle: true,
      backgroundColor: const Color.fromARGB(221, 185, 236, 138),
      foregroundColor: const Color.fromARGB(255, 36, 31, 2),
      ),
      body: myGrid(context)
    );
  }
Widget myContainer(BuildContext context){
  return Container(
        width: 300,height: 500,
        color: const Color.fromARGB(255, 209, 131, 131),
        margin:const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network('https://picsum.photos/id/200/300',
              fit:BoxFit.cover),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 66, 22, 22),
                foregroundColor: const Color.fromARGB(255, 241, 237, 236)
             
              ),
              onPressed: (){
                Navigator.pushNamed(context,'/ptd_dt',
                arguments: {'uri':'https://picsum.photos/id/200/300'}
                );
              }, 
              child: const Text('Detail'))
          ],
        ),
      );
}

  Widget myGrid(BuildContext ctx){
    return GridView.builder(
      itemCount: 10,
      padding:const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3/4,
        crossAxisSpacing: 5,mainAxisSpacing: 5),
      itemBuilder:(ctx,index)=>ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: buildTile(ctx,(index+1),(Random().nextInt(200)+50)),
      ));
  }
  Widget buildTile(BuildContext ctx, int index, int price) =>GridTile(
    footer: GridTileBar(
      backgroundColor: Colors.black26,
      title: Text('Item no: $index'),
      subtitle: Text('Price: $price'),
      trailing: InkWell(
        child: const Icon(Icons.zoom_in,size: 32,color: Colors.white,),
        onTap: ()=>{
          Navigator.pushNamed(ctx, '/ptd_dt',
          arguments:{'id':index,'price':price} )

        },
      ),
    ),
    child: Image.network('https://picsum.photos/id/${index*9}/500',
    fit: BoxFit.cover)
    );
} 