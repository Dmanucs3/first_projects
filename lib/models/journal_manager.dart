
// import 'package:flutter/foundation.dart';

// import 'models.dart';

// class JournalManager extends ChangeNotifier {
//   final List<JournalEntry> _entries = <JournalEntry>[];

//   /// Returns an unmodifiable copy of all known [JournalEntry] objects.
//   List<JournalEntry> get entries => List.unmodifiable(_entries);

//   void deleteItem(int index) {
//     _entries.removeAt(index);
//     notifyListeners();
//   }

//   void addItem(JournalEntry item) {
//     _entries.add(item);
//     notifyListeners();
//   }

//   void updateItem(JournalEntry item, int index) {
//     _entries[index] = item;
//     notifyListeners();
//   }
// }

import 'package:flutter/foundation.dart';

import 'models.dart';

class JournalManager extends ChangeNotifier {
  List<JournalEntry>? _sortedEntries = <JournalEntry>[];
  final Map<String, JournalEntry> _byId = {};

  /// Returns an unmodifiable copy of all known [JournalEntry] objects.
  List<JournalEntry> get entries {
    // Restore the cached sorted list if necessary.
    // _sortedEntries ??= _byId.values.toList()
    //   ..sort((a, b) => a.date.compareTo(b.date));

    // Now, return an unmodifiable list for the UI to render.
    return List.unmodifiable(_sortedEntries!);
  }

  void deleteItem(JournalEntry item) {
    _byId.remove(item.id);
    _sortedEntries = null;
    notifyListeners();
  }

  JournalEntry? getItem(String id) => _byId[id];

  void setItem(JournalEntry item) {
    _byId[item.id] = item;
    _sortedEntries = null;
    notifyListeners();
  }
}
