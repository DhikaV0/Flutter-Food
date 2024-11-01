import 'package:flutter/material.dart';
import 'package:food_app/pages/AddData.dart';

class PostAdd extends StatelessWidget {
  // Sample product data
  final List<Map<String, dynamic>> products = [
    {
      "image": "images/burger.png",
      "name": "Burger King Medium",
      "price": "Rp.58,000.00"
    },
    {
      "image": "images/teh.png",
      "name": "Teh Botol",
      "price": "Rp.4,000.00"
    },
    {
      "image": "images/burger.png",
      "name": "Burger King Small",
      "price": "Rp.35,000.00"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.person, color: Colors.black),
            onPressed: () {},
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddData()),
                  );
                },
                child: const Text('Add Data +'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Text("Foto", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Nama Produk", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Harga", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Aksi", style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                          products[index]["image"],
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                        Text(products[index]["name"]),
                        Text(products[index]["price"]),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
