import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/product_service.dart';
import '../widgets/product_card.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    final productService = Provider.of<ProductService>(context, listen: false);
    await productService.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tüm Ürünler'),
      ),
      body: RefreshIndicator(
        onRefresh: _loadProducts,
        child: productService.isLoading
            ? const Center(child: CircularProgressIndicator())
            : productService.products.isEmpty
                ? const Center(
                    child: Text('Henüz ürün yok'),
                  )
                : GridView.builder(
                    padding: const EdgeInsets.all(16),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemCount: productService.products.length,
                    itemBuilder: (context, index) {
                      final product = productService.products[index];
                      return ProductCard(
                        product: product,
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            '/product-detail',
                            arguments: product,
                          );
                        },
                      );
                    },
                  ),
      ),
    );
  }
}







