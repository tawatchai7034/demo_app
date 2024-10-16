import 'package:flutter/material.dart';

import '../../../api/productService.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  var productService = ProductService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productService.getAll();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
