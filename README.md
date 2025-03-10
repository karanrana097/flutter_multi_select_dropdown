# MultiSelectDropdown  

A customizable **multi-select dropdown** widget for Flutter, supporting search and "Select All" functionality.  

## ✨ Features  
- Supports multi-selection from a given list  
- Optional **search bar** for filtering items  
- **Select All** option for quick selection  
- Easy-to-use API with `onChange` callback  
- Works with both **key-value** and **simple lists**  

## 📦 Installation  
Add this to your `pubspec.yaml`:  
```yaml
dependencies:
  multi_select_dropdown: latest_version
```
Then, run:  
```sh
flutter pub get
```

## 🚀 Usage  

### 1️⃣ Basic Example  
```dart
import 'package:flutter/material.dart';
import 'package:multi_select_dropdown/multi_select_dropdown.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("MultiSelectDropdown Example")),
        body: Center(
          child: MultiSelectDropdown(
            list: [
              {'id': 'dog', 'label': 'Dog'},
              {'id': 'cat', 'label': 'Cat'},
              {'id': 'mouse', 'label': 'Mouse'},
            ],
            initiallySelected: ['cat'],
            onChange: (selectedItems) {
              print("Selected: $selectedItems");
            },
            includeSearch: true,
            includeSelectAll: true,
          ),
        ),
      ),
    );
  }
}
```

### 2️⃣ Simple List Example  
```dart
MultiSelectDropdown.simpleList(
  list: ['Apple', 'Banana', 'Cherry'],
  initiallySelected: ['Banana'],
  onChange: (selectedItems) {
    print("Selected: $selectedItems");
  },
  includeSearch: true,
);
```

## 📜 License  
This package is released under the MIT License.

