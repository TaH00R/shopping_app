import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(child: const Text('Cart',
        style: TextStyle(
          fontWeight: FontWeight.bold
        ),)),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index){
          final cartItem = cart[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(cartItem['imageURL'] as String),
              radius: 30,
            ),
            trailing: IconButton(
              onPressed: () {
                showDialog(context: context, 
                builder: (context){
                  return AlertDialog(
                    title: Text('Delete Product',
                    style:Theme.of(context).textTheme.titleMedium ,),
                    content: const Text('Are you Sure You Want To Remove this Product?'),
                    actions: [
                      TextButton(onPressed: (){
                        Navigator.of(context).pop();
                      }, child: const Text('No'
                      ,style: TextStyle(fontWeight: FontWeight.bold))),
                      TextButton(onPressed: (){
                        Provider.of<CartProvider>(context, listen:false).removeProduct(cartItem);
                        Navigator.of(context).pop();
                      }, child: const Text('Yes',
                      style: TextStyle(fontWeight: FontWeight.bold)))
                    ],
                  );
                });
                },
              icon: const Icon(Icons.delete, color: Colors.red,),
            ),
            title: Text(cartItem['title'].toString(),
            style: Theme.of(context).textTheme.bodySmall,),
            subtitle: Text('Size: ${cartItem['size']}'),
           );
        },
      )
      );
  }
}