import 'package:flutter/material.dart';
import 'package:flutter_multi_select_dropdown/flutter_multi_select_dropdown.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('MultiSelectDropdown renders correctly',
      (WidgetTester tester) async {
    final List<Map<String, String>> testList = [
      {'id': '1', 'label': 'Option 1'},
      {'id': '2', 'label': 'Option 2'},
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: MultiSelectDropdown(
            list: testList,
            initiallySelected: const [],
            onChange: (selectedItems) {},
          ),
        ),
      ),
    );

    expect(find.text('Option 1'), findsOneWidget);
    expect(find.text('Option 2'), findsOneWidget);
  });
}
