import 'package:flutter/material.dart';

class PemesananPage extends StatefulWidget {
  const PemesananPage({Key? key}) : super(key: key);

  @override
  _PemesananPageState createState() => _PemesananPageState();
}

class _PemesananPageState extends State<PemesananPage> {
  String _selectedItem = '';

  List<String> _items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pemesanan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<String>(
              value: _selectedItem,
              onChanged: (value) {
                setState(() {
                  _selectedItem = value!;
                });
              },
              items: _items.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              hint: Text('Pilih Item'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Logika untuk menangani tombol pemesanan
                if (_selectedItem.isNotEmpty) {
                  // Lakukan sesuatu dengan item yang dipilih
                  print('Item yang dipilih: $_selectedItem');
                } else {
                  // Tampilkan pesan bahwa item belum dipilih
                  print('Pilih item terlebih dahulu');
                }
              },
              child: Text('Pesan Sekarang'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PemesananPage(),
  ));
}
