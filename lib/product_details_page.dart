import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/cart_provider.dart';

class ProductDetailsPage extends StatefulWidget {
  final Map<String,Object>product;
  const ProductDetailsPage({super.key
  , required this.product});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int selectedSize = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(child: const Text('Details')),
      ),
      body: Column(
        children: [
          Center(
            child: Text(widget.product['title'] as String,
            style: Theme.of(context).textTheme.titleLarge),
          ) ,
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(widget.product['imageURL'] as String),
          ),
          const Spacer(flex: 2),
          Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 240, 235, 229),
              borderRadius: BorderRadius.circular(40)
            ),
            child: Column(
              children: [
                const SizedBox(height: 25,),
                Text('\$${widget.product['price']}',
                style: Theme.of(context).textTheme.titleLarge,),
                const SizedBox(height: 10,),
                SizedBox(
                  height:50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: (widget.product['sizes'] as List<int>).length,
                    itemBuilder: (context, index){
                      final size = (widget.product['sizes'] as List<int>)[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              selectedSize = size;
                            });
                          },
                          child: Chip( 
                            label: Text(size.toString(),),
                            backgroundColor: selectedSize == size ?
                             Colors.indigoAccent
                             : null),
                        ),
                      );
                    }),
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton.icon(onPressed: (){
                    if(selectedSize!=0){
                      Provider.of<CartProvider>(context
                    ,listen:false).addProduct(
                        {'id':widget.product['id'],
                        'title':widget.product['title'],
                        'price': widget.product['price'],
                        'size': selectedSize,
                        'company':widget.product['company'],
                        'imageURL':widget.product['imageURL'],}
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content:Text('Product Added Successfully'))
                      );
                    }
                    else{
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content:Text('Please Select a Size'))
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    minimumSize: const Size(double.infinity, 50),
                  ), 
                  icon: Icon(Icons.shopping_cart_outlined,
                  color: Colors.black,
                  size: 30,),
                  label: const Text('Add To Cart',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    )),
                  ),
                )
              ],
            ),
          )
        ],
      ),

    );
  }
}