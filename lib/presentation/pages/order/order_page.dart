import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class OrderPage extends ConsumerWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('주문하기'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '픽업 매장 선택',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            Card(
              child: ListTile(
                leading: const Icon(Icons.store),
                title: const Text('Fluffee 강남점'),
                subtitle: const Text('서울시 강남구 역삼동 123-45'),
                trailing: const Icon(Icons.check_circle),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              '주문 내역',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            ...List.generate(3, (index) {
              return ListTile(
                title: Text('메뉴 ${index + 1}'),
                subtitle: const Text('1개'),
                trailing: const Text('₩5,000'),
              );
            }),
            const Divider(),
            ListTile(
              title: Text(
                '총 금액',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              trailing: Text(
                '₩15,000',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FilledButton(
            onPressed: () {
              context.go('/order/tracking/1');
            },
            child: const Text('결제하기'),
          ),
        ),
      ),
    );
  }
}