import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class StoreLocatorPage extends ConsumerStatefulWidget {
  const StoreLocatorPage({super.key});

  @override
  ConsumerState<StoreLocatorPage> createState() => _StoreLocatorPageState();
}

class _StoreLocatorPageState extends ConsumerState<StoreLocatorPage> {
  bool _isMapView = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('매장 찾기'),
        actions: [
          IconButton(
            icon: Icon(_isMapView ? Icons.list : Icons.map),
            onPressed: () {
              setState(() {
                _isMapView = !_isMapView;
              });
            },
          ),
        ],
      ),
      body: _isMapView ? _buildMapView() : _buildListView(),
    );
  }

  Widget _buildMapView() {
    return Container(
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: const Center(
        child: Text('지도 뷰'),
      ),
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const CircleAvatar(
            child: Icon(Icons.store),
          ),
          title: Text('Fluffee 매장 ${index + 1}'),
          subtitle: Text('거리: ${(index + 1) * 0.5}km'),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            context.go('/store/detail/${index + 1}');
          },
        );
      },
    );
  }
}