// import 'package:business/Controller/database_helper.dart';
// import 'package:flutter/material.dart';
//
// class Import extends StatefulWidget {
//   const Import({super.key});
//
//   @override
//   _ImportState createState() => _ImportState();
// }
//
// class _ImportState extends State<Import> {
//   List<Map<String, dynamic>> dataRows = [];
//   List<String> itemChoices = ["Xi măng", "Cát", "Sắt", "Sơn"];
//   String? selectedItem;
//   TextEditingController quantityController = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     _loadData();
//   }
//
//   Future<void> _loadData() async {
//     List<Map<String, dynamic>> items =
//         await DatabaseHelper.instance.getAllItems();
//     setState(() {
//       dataRows = items;
//     });
//   }
//
//   Future<void> _addData() async {
//     if (selectedItem != null && quantityController.text.isNotEmpty) {
//       Map<String, dynamic> newItem = {
//         "name": selectedItem!,
//         "quantity": quantityController.text,
//       };
//
//       await DatabaseHelper.instance.insertItem(newItem);
//       _loadData(); // Refresh UI after adding
//
//       // Close the dialog
//       if (Navigator.canPop(context)) {
//         Navigator.pop(context);
//       }
//     } else {
//       print("⚠️ Please select an item and enter a quantity.");
//     }
//   }
//
//   void _showAddDataDialog() {
//     selectedItem = null;
//     quantityController.clear();
//
//     showDialog(
//       context: context,
//       builder: (dialogContext) {
//         return AlertDialog(
//           title: Text("Nhập thông tin"),
//           content: StatefulBuilder(
//             builder: (context, setDialogState) {
//               return Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   DropdownButtonFormField<String>(
//                     value: selectedItem,
//                     hint: Text("Chọn vật liệu"),
//                     items: itemChoices.map((String item) {
//                       return DropdownMenuItem<String>(
//                         value: item,
//                         child: Text(item),
//                       );
//                     }).toList(),
//                     onChanged: (newValue) {
//                       setDialogState(() {
//                         selectedItem = newValue;
//                       });
//                     },
//                     decoration: InputDecoration(
//                       labelText: "Loại",
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   TextField(
//                     controller: quantityController,
//                     decoration: InputDecoration(labelText: "Số lượng"),
//                     keyboardType: TextInputType.number,
//                     onSubmitted: (_) => _addData(), // Press Enter to add
//                   ),
//                 ],
//               );
//             },
//           ),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(dialogContext),
//               child: Text("Hủy"),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 _addData();
//               },
//               child: Text("Thêm"),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   Future<void> _clearAllData() async {
//     await DatabaseHelper.instance.deleteAllItems();
//     _loadData();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Danh sách nhập vật liệu"),
//         actions: [
//           IconButton(
//             onPressed: _showAddDataDialog,
//             icon: Icon(Icons.add_box, size: 36),
//           ),
//           IconButton(
//             onPressed: _clearAllData,
//             icon: Icon(Icons.delete, size: 36, color: Colors.red),
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: DataTable(
//             columns: [
//               DataColumn(label: Text("Tên nguyên vật liệu")),
//               DataColumn(label: Text("Số lượng")),
//             ],
//             rows: dataRows
//                 .map(
//                   (row) => DataRow(
//                     cells: [
//                       DataCell(Text(row["name"]!)),
//                       DataCell(Text(row["quantity"]!)),
//                     ],
//                   ),
//                 )
//                 .toList(),
//           ),
//         ),
//       ),
//     );
//   }
// }
