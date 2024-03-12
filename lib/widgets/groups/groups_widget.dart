import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class GroupsWidget extends StatelessWidget {
  const GroupsWidget({super.key});

  void showForm(BuildContext context) {
    Navigator.of(context).pushNamed('/groups/form');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Группы'),
      ),
      body: const _GroupListWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showForm(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _GroupListWidget extends StatefulWidget {
  const _GroupListWidget();

  @override
  State<_GroupListWidget> createState() => __GroupListState();
}

class __GroupListState extends State<_GroupListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: 100,
        separatorBuilder: (BuildContext context, int index) {
          return _GroupListRowWidget(indexInList: index);
        },
        itemBuilder: (BuildContext context, int index) {
          return const Divider(
            height: 1,
          );
        });
  }
}

class _GroupListRowWidget extends StatefulWidget {
  final int indexInList;
  const _GroupListRowWidget({
    required this.indexInList,
  });

  @override
  State<_GroupListRowWidget> createState() => __GroupListRowWidgetState();
}

class __GroupListRowWidgetState extends State<_GroupListRowWidget> {
  void doNothing(BuildContext context) {}
  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: doNothing,
            backgroundColor: const Color.fromARGB(255, 227, 48, 12),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: ListTile(
        title: const Text('Slide me'),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {},
      ),
    );
  }
}
