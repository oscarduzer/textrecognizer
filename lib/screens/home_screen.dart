import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:textrecognizer/models/models.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isListViewMode=false;

  List<Document> _documents=[
    Document(path: "assets/presentation_1.pdf"),
    Document(path: "assets/presentation_2.words"),
    Document(path: "assets/presentation_3.txt"),
    Document(path: "assets/presentation_3"),
  ];



  _toggleDataViewMode(){
    setState(() {
      this._isListViewMode=!this._isListViewMode;
    });
  }


  Color _getColorWithOpacity(Color color, double opacity){
      return color.withValues(alpha: opacity);
  }

  Widget _itemWidget(BuildContext context, int index){
    return Card(
      elevation: 0,
      color: _getColorWithOpacity(this._documents[index].getDocumentColor(), 0.1),
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.zero,
        borderSide: BorderSide(
          color: Colors.transparent,
          width: 0,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
              padding:EdgeInsets.symmetric(horizontal: 5,vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: this._getColorWithOpacity(this._documents[index].getDocumentColor(), 0.3),
                  ),
                  child: this._documents[index].getDocumentIcon(this._getColorWithOpacity(this._documents[index].getDocumentColor(), 0.55)),
                ),
                Icon(Icons.more_vert_outlined,)
              ],
            ),
          )
        ],
      )
    );
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            leading: Builder(
                builder: (context){
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: (){
                          Scaffold.of(context).openDrawer();
                        },
                        icon:Icon(Icons.menu,color: Color(0xA9151515),),
                        style: ButtonStyle(
                            fixedSize: WidgetStateProperty.all<Size>(Size(20, 20))
                        ),
                      ),
                      IconButton(onPressed: ()=>{},icon:Icon(Icons.search,color: Color(0xC0121111),),style: ButtonStyle(
                          fixedSize: WidgetStateProperty.all<Size>(Size(20, 20))
                      )),
                    ],
                  );
                }
            ),
            leadingWidth: MediaQuery.of(context).size.width,
            bottom: PreferredSize(
                preferredSize: Size(MediaQuery.of(context).size.width, 30),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Text(
                        "Salut, Bienvenue",
                        style: Theme.of(context).textTheme.displayLarge!.copyWith(
                            fontSize: 25
                        ),
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                )
            ),
          ),
          backgroundColor: Theme.of(context).primaryColor,
          body: SafeArea(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            AnimatedContainer(
                              duration: Duration(milliseconds: 200),
                              child: IconButton(
                                  onPressed: _toggleDataViewMode
                                  , icon: Icon(Icons.list,color: _isListViewMode?Colors.lightBlueAccent:Colors.black,)
                              ),
                            ),
                            AnimatedContainer(
                              duration: Duration(milliseconds: 200),
                              child: IconButton(
                                  onPressed: _toggleDataViewMode
                                  , icon: Icon(Icons.grid_view,color: _isListViewMode?Colors.black:Colors.lightBlue)
                              ),
                            )
                          ]
                      ),
                      Expanded(
                          child: GridView.builder(
                            gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                            itemCount: _documents.length,
                            itemBuilder: (context,index){
                              return _itemWidget(context, index);
                            },
                          )
                      )
                    ],
                  ),
              ),
            ),
          ),
          drawer: Drawer(
            width: MediaQuery.of(context).size.width*0.55,
            elevation: 2,
            shadowColor: Colors.transparent,
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.zero
            ),
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                child: ListView(
                  children: [
                    Text(
                      "Menu",
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontSize: 25
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.history),
                      title: Text("Récents"),
                      onTap: (){},
                    )
                  ],
                ),
              ),
            ),
          ),
          drawerEnableOpenDragGesture: true,
          floatingActionButton: AnimatedContainer(
              duration: Duration(seconds: 2),
              child: IconButton(onPressed: ()async{
                  PermissionStatus status= await Permission.manageExternalStorage.request();
                  if(status.isGranted){
                    var directory=new Directory('/storage/emulated/0/');
                    var files=await directory.listSync();
                    print(files);
                  }
                  else{
                    print("Permission denied");
                  }
              }, icon: Icon(Icons.document_scanner)),
          ),
        )
    );
  }
}
