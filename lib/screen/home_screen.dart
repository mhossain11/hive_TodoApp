import 'package:cach_hive/model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../widgets/dialog.dart';
import '../widgets/popupmenuitem.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController controller = TextEditingController();
  TextEditingController editController = TextEditingController();
  var myBox = Hive.box('MyBox');
  List myData =[];
  @override
  void initState() {
    super.initState();
    getItem();
  }

  void addItem(data)async{
    await myBox.add(data);
    print(myBox.values);
    getItem();
  }

  void deleteItem(key)async{
    await myBox.delete(key);
    getItem();
  }

  void updateItem(key,value)async{
    await myBox.put(key, value);

    getItem();
  }

  getItem(){
    myData = myBox.keys.map((e){
      var res  = myBox.get(e);
      return {
        'Key':e,
        'title':res['title']
      };
    }).toList();

    setState(() {});
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: ()async{
          await showDialog(context: context,
              barrierDismissible: false, // 🔥 বাইরে ট্যাপ করলে বন্ধ হবে না
              builder: (_)=>InputDialog(
                controller: controller,
                btnTitle: "Ok",
                onTab: (){
                  Map detas = {
                    'title': controller.text
                  };
                addItem(detas);
                Navigator.pop(context);
                controller.clear();
              },));
        },
        backgroundColor: Colors.grey,
        child: Icon(Icons.add,color: Colors.white,size: 30,),
      ),
      
      body: SafeArea(
        child: ListView.builder(
            itemCount: myData.length,
            //shrinkWrap: true,
           // physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context,index){
              return Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text("${myData[index]['title']}"),
                    subtitle: Text("${myData[index]['Key']}"),
                    trailing: PopUpMenuItems(
                      hiveKey: myData[index]['Key'],
                      title: myData[index]['title'],
                      onDelete: (key) {
                        deleteItem(key);
                      },
                      onEdit: (key, title) {
                        editController.text = title;

                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (_) => InputDialog(
                            controller: editController,
                            btnTitle: "Update",
                            onTab: () {
                              updateItem(key, {
                                'title': editController.text,
                              });
                              Navigator.pop(context);
                              editController.clear();
                            },
                          ),
                        );
                      },
                    )
                  ),
                ),
              );
            }),
      ),
    );
  }
}
