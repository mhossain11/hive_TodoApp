import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PopUpMenuItems extends StatelessWidget{
  final int hiveKey;
  final String title;
  final Function(int key) onDelete;
  final Function(int key, String title) onEdit;

  const PopUpMenuItems({
    super.key,
    required this.hiveKey,
    required this.title,
    required this.onDelete,
    required this.onEdit,
  });
  @override
  Widget build(BuildContext context) {

    return PopupMenuButton<String>(
      onSelected: (value){
        if (value == 'delete') {
          onDelete(hiveKey);
        } else if (value == 'edit') {
          onEdit(hiveKey, title);
        }
      },
      itemBuilder: (BuildContext context)=>[
        PopupMenuItem(
            value: 'delete',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Delete'),
                Icon(Icons.delete)
              ],
            )),

        PopupMenuItem(
            value: 'edit',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Edit'),
                Icon(Icons.edit)
              ],
            ),


        ),
      ],
      icon: Icon(Icons.more_vert),
    );

  }

}