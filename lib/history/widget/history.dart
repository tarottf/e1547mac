import 'package:e1547/client/client.dart';
import 'package:e1547/history/history.dart';
import 'package:e1547/shared/shared.dart';
import 'package:flutter/material.dart';

class HistoriesPage extends StatelessWidget {
  const HistoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SubChangeNotifierProvider<Client, HistoryController>(
      create: (context, client) => HistoryController(client: client),
      child: Consumer<HistoryController>(
        builder: (context, controller, child) => SelectionLayout<History>(
          items: controller.items,
          child: const AdaptiveScaffold(
            appBar: HistoryAppBar(),
            floatingActionButton: HistorySearchFab(),
            drawer: RouterDrawer(),
            endDrawer: ContextDrawer(
              title: Text('History'),
              children: [
                HistoryEnableTile(),
                HistoryLimitTile(),
                HistoryClearTile(),
                Divider(),
                HistoryCategoryFilterTile(),
                HistoryTypeFilterTile(),
              ],
            ),
            body: HistoryList(),
          ),
        ),
      ),
    );
  }
}
