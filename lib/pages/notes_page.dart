import 'package:fitness_planner/data/item_model.dart';
import 'package:fitness_planner/services/database_helper.dart';
import 'package:flutter/material.dart';



class CrudApp extends StatefulWidget {
  const CrudApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CrudAppState createState() => _CrudAppState();
}

class _CrudAppState extends State<CrudApp> {
  final DatabaseHelper dbHelper = DatabaseHelper();
  List<Item> items = [];
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchItems();
  }

  Future<void> _fetchItems() async {
    final List<Map<String, dynamic>> data = await dbHelper.fetchItems();
    setState(() {
      items = data.map((item) => Item.fromMap(item)).toList();
    });
  }

  Future<void> _addItem() async {
    final newItem = Item(
      title: titleController.text,
      description: descriptionController.text,
    );
    await dbHelper.insertItem(newItem.toMap());
    titleController.clear();
    descriptionController.clear();
    _fetchItems();
  }

  Future<void> _updateItem(Item item) async {
    final updatedItem = Item(
      id: item.id,
      title: titleController.text,
      description: descriptionController.text,
    );
    await dbHelper.updateItem(updatedItem.toMap());
    titleController.clear();
    descriptionController.clear();
    _fetchItems();
  }

  Future<void> _deleteItem(int id) async {
    await dbHelper.deleteItem(id);
    _fetchItems();
  }

  void _showItemDialog([Item? item]) {
    if (item != null) {
      titleController.text = item.title;
      descriptionController.text = item.description;
    } else {
      titleController.clear();
      descriptionController.clear();
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(item == null ? 'Add Item' : 'Update Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                if (item == null) {
                  _addItem();
                } else {
                  _updateItem(item);
                }
              },
              child: Text(item == null ? 'Add' : 'Update'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SQLite CRUD App'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            title: Text(item.title),
            subtitle: Text(item.description),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () => _showItemDialog(item),
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => _deleteItem(item.id!),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showItemDialog(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
