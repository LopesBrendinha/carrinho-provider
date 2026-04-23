
import 'package:ecomerce/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Carrinho')),

      body: Column(
        children: [
          // LISTA DE ITENS DO CARRINHO
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                final item = cart.items[index];

                return ListTile(
                  title: Text(item.name),
                  subtitle: Text('R\$ ${item.price}'),

                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => cart.remove(item),
                  ),
                );
              },
            ),
          ),


          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [

                Text(
                  'Total: R\$ ${cart.totalPrice.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 20),
                ),

                SizedBox(height: 10),


                ElevatedButton(
                  onPressed: () {},
                  child: Text('Finalizar Compra'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
