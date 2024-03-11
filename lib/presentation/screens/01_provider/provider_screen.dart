import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';

class ProviderScreen extends ConsumerStatefulWidget {
  const ProviderScreen({super.key});

  @override
  ProviderScreenState createState() => ProviderScreenState();
}

class ProviderScreenState extends ConsumerState<ProviderScreen> {
  String getName() {
    final nameProvider = ref.watch(simpleNameProvider);
    return nameProvider;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider'),
      ),
      body: Center(
        child: Text(getName()),
      ),
    );
  }
}
