import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class OrderStatus {
  final String orderNumber;
  final String status;

  OrderStatus(this.orderNumber, this.status);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: OrderStatusPage(),
    );
  }
}

class OrderStatusPage extends StatefulWidget {
  const OrderStatusPage({super.key});

  @override
  _OrderStatusPageState createState() => _OrderStatusPageState();
}

class _OrderStatusPageState extends State<OrderStatusPage> {
  List<OrderStatus> orderStatusList = [
    OrderStatus('123456', 'Dalam Proses Pengemasan'),
    OrderStatus('789012', 'Dikirim'),
    OrderStatus('345678', 'Diterima'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Status Pemesanan'),
      ),
      body: ListView.builder(
        itemCount: orderStatusList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text('Nomor Order: ${orderStatusList[index].orderNumber}'),
              subtitle: Text('Status: ${orderStatusList[index].status}'),
            ),
          );
        },
      ),
    );
  }
}
