import 'package:flutter/material.dart';
import 'package:remote_toy_kit/remote_toy_kit.dart';
import 'package:remote_toy_kit_example/src/device_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final RemoteToyKit remoteToyKit;
  final List<RemoteToySearchedDevice> _searchedDevices = [];

  @override
  void initState() {
    remoteToyKit = RemoteToyKit();
    remoteToyKit.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Remote Toy Kit'),
          ),
        ),
        body: ListView.builder(
          itemCount: _searchedDevices.length,
          itemBuilder: (context, index) {
            final RemoteToySearchedDevice device = _searchedDevices[index];
            return Card(
              child: InkWell(
                borderRadius: BorderRadius.circular(12.0),
                onTap: () {
                  device.connector.connect().then((device) {
                    if (context.mounted) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return DevicePage(device: device);
                          },
                        ),
                      );
                    }
                  });
                },
                child: Container(
                  height: 50.0,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(device.name),
                      ),
                      const SizedBox(width: 8.0),
                      Flexible(
                        child: Text(
                          device.address,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        floatingActionButton: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
              onPressed: () {
                if (remoteToyKit.isSearchInProgress) return;
                setState(() {
                  _searchedDevices.clear();
                });
                remoteToyKit.search().listen((searchedDevice) {
                  setState(() {
                    _searchedDevices.add(searchedDevice);
                  });
                });
              },
              heroTag: 'btn-search',
              child: const Icon(Icons.add),
            ),
          ],
        ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
