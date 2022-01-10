// import 'package:navigationn/features/journal/add_journal_entry_page.dart';
// import 'package:navigationn/features/journal/journal.dart';
// import 'package:navigationn/models/models.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class JournalPage extends StatelessWidget {
//   const JournalPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Consumer<JournalManager>(
//         builder: (context, manager, child) {
//           return manager.entries.isEmpty
//               ? const EmptyJournalView()
//               : const JournalListView();
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           final manager = Provider.of<JournalManager>(context, listen: false);
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => AddJournalEntryPage(
//                 onSave: (item) {
//                   manager.addItem(item);
//                   Navigator.pop(context);
//                 },
//               ),
//             ),
//           );
//         },
//         child: const Icon(Icons.edit),
//       ),
//     );
//   }
// }

import '/features/journal/journal.dart';
import '/models/models.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class JournalPage extends StatelessWidget {
  const JournalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<JournalManager>(
        builder: (context, manager, child) {
          return manager.entries.isEmpty
              ? const EmptyJournalView()
              : const JournalListView();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/journal/add'),
        child: const Icon(Icons.edit),
      ),
    );
  }
}
