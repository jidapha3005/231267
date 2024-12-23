import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as 
                          Map<String,dynamic>;

    var id = args['id'];
    var price = args['price'];

    return Scaffold(
      appBar: AppBar(title: const Text('Product Detail'),
      centerTitle: true,
      backgroundColor: const Color.fromARGB(221, 185, 236, 138),
      foregroundColor: const Color.fromARGB(255, 36, 31, 2),
      ),
      body: myDisplay(context, id, price)
    );
  }
  Widget detail()=>Container(
    alignment: Alignment.centerLeft,
    child:const Text('ของสะสมของนายนธี อินเดียแดง ลูกครึ่งอินเดียโปรตุเกศ'),
  );

  Widget showPrice(int id, int price)=>Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Item on.$id'),
          Text('Price:\$$price')
        ],),
        const Row(mainAxisAlignment: 
        MainAxisAlignment.end,
        children: [
          Icon(Icons.add_shopping_cart,color: Colors.pink,)
        ],)
    ]
  );
  Widget myDisplay(BuildContext cxt, int id, int price){
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: (Image.network('https://picsum.photos/id/${id*9}/500'
            ,fit:BoxFit.cover)),
        ),
        const SizedBox(height: 15,),
        showPrice (id, price),
        const SizedBox(height: 15,),
        detail()
      ],),
    );
  }

  Widget myContainer(BuildContext context ,int id) {
    return Container(
        padding: EdgeInsets.all(16),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
             child: Image.network('https://picsum.photos/id/${id*9}/500'
            ,fit:BoxFit.cover),
          ),
         
          const SizedBox(height: 15),
          detail(),
          const SizedBox(height: 15),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 66, 22, 22),
                foregroundColor: const Color.fromARGB(255, 241, 237, 236)
              ),
              onPressed: (){
                
              }, 
              child: const Text(' << Back'))
        ],
      ),
    );
  }
  
}