import 'package:ecomerce/models/product.dart';
import 'package:ecomerce/pages/cart_page.dart';
import 'package:ecomerce/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatelessWidget {
  final List<Product> products = [
    Product(name: 'Notebook', price: 3500),
    Product(name: 'Mouse', price: 80),
    Product(name: 'Teclado', price: 150),
    Product(name: 'Monitor', price: 900),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Produtos'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => CartPage()),
              );
            },
          )
        ],
      ),


      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];

          return ListTile(
            title: Text(product.name), // nome
            subtitle: Text('R\$ ${product.price}'), // preço


            trailing: ElevatedButton(
              child: Text('Adicionar'),
              onPressed: () {
                Provider.of<CartProvider>(context, listen: false)
                    .add(product);
              },
            ),
          );
        },
      ),
    );
  }
}