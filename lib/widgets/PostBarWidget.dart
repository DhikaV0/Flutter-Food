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
        if (postData != null) ...[
          Text('Nama Produk: ${postData?['name'] ?? ''}'),
          Text('Harga: ${postData?['price'] ?? ''}'),
          Text('Kategori: ${postData?['category'] ?? ''}'),
        ] else
          Text('Belum ada data yang ditambahkan'),
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
                MaterialPageRoute(
                  builder: (context) => AddData(
                    onSubmit: (data) {
                      // Konversi data ke Map<String, String?>
                      setState(() {
                        _postData = data.map(
                          (key, value) => MapEntry(key, value.toString()),
                        );
                      });
                    },
                  ),
                ),
              );

              if (result != null) {
                setState(() {
                  _postData = result.map(
                    (key, value) => MapEntry(key, value.toString()),
                  );
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
                  color: Colors.white, // Memastikan warna teks terlihat
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
