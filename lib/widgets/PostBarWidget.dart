import 'package:flutter/material.dart';
import 'package:food_app/pages/AddData.dart';

class PostBarWidget extends StatelessWidget {
  final Map<String, String?>? postData;

  PostBarWidget({this.postData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Nama Produk: ${postData?['name'] ?? 'N/A'}'),
        Text('Harga: ${postData?['price'] ?? 'N/A'}'),
        Text('Kategori: ${postData?['category'] ?? 'N/A'}'),
        Text('Image: ${postData?['image'] ?? 'N/A'}'),
      ],
    );
  }
}

class YourWidget extends StatefulWidget {
  @override
  _YourWidgetState createState() => _YourWidgetState();
}

class _YourWidgetState extends State<YourWidget> {
  Map<String, String?>? _postData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PostBarWidget(postData: _postData),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddData()),
              );
              if (result != null) {
                setState(() {
                  _postData = result;
                });
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Add Data +',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
