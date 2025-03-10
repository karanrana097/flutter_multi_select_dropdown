import 'package:flutter/material.dart';

class MultiSelectDropdown extends StatefulWidget {
  final List<Map<String, String>> list;
  final List<String> initiallySelected;
  final Function(List<String>) onChange;
  final bool includeSearch;
  final bool includeSelectAll;

  const MultiSelectDropdown({
    super.key,
    required this.list,
    required this.onChange,
    this.initiallySelected = const [],
    this.includeSearch = false,
    this.includeSelectAll = false,
  });

  factory MultiSelectDropdown.simpleList({
    Key? key,
    required List<String> list,
    required Function(List<String>) onChange,
    List<String> initiallySelected = const [],
    bool includeSearch = false,
    bool includeSelectAll = false,
  }) {
    return MultiSelectDropdown(
      key: key,
      list: list.map((item) => {'id': item, 'label': item}).toList(),
      onChange: onChange,
      initiallySelected: initiallySelected,
      includeSearch: includeSearch,
      includeSelectAll: includeSelectAll,
    );
  }

  @override
  _MultiSelectDropdownState createState() => _MultiSelectDropdownState();
}

class _MultiSelectDropdownState extends State<MultiSelectDropdown> {
  List<String> selectedItems = [];

  @override
  void initState() {
    super.initState();
    selectedItems = widget.initiallySelected;
  }

  void _toggleSelection(String id) {
    setState(() {
      if (selectedItems.contains(id)) {
        selectedItems.remove(id);
      } else {
        selectedItems.add(id);
      }
      widget.onChange(selectedItems);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        hintText: 'Select items',
      ),
      onTap: () {
        _showMultiSelectDialog(context);
      },
      items: [],
      onChanged: (_) {},
    );
  }

  void _showMultiSelectDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Select Items"),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView(
              shrinkWrap: true,
              children: [
                if (widget.includeSearch)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: const InputDecoration(
                        labelText: "Search",
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (query) {
                        setState(() {});
                      },
                    ),
                  ),
                if (widget.includeSelectAll)
                  CheckboxListTile(
                    title: const Text("Select All"),
                    value: selectedItems.length == widget.list.length,
                    onChanged: (value) {
                      setState(() {
                        if (value == true) {
                          selectedItems =
                              widget.list.map((item) => item['id']!).toList();
                        } else {
                          selectedItems.clear();
                        }
                        widget.onChange(selectedItems);
                      });
                    },
                  ),
                ...widget.list.map((item) {
                  return CheckboxListTile(
                    title: Text(item['label']!),
                    value: selectedItems.contains(item['id']),
                    onChanged: (_) => _toggleSelection(item['id']!),
                  );
                }).toList(),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }
}
