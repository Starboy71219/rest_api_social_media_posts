import 'package:flutter/material.dart';
import 'package:friend_request_fb/services/remote_services.dart';

import '../models/posts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  List<Post>? posts;
  var isLoaded=false;
  @override

  void initState(){
    super.initState();
    getData();
  }
  void getData()async{
    posts=await RemoteService().getPosts();
    if(posts!=null){
      setState(() {
        isLoaded=true;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('POSTS'),
      ),
      //-----------------------------------------------------------
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(itemCount: posts?.length,
          itemBuilder: (context, index){
          return Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey[300],
                  ),
                ),
                SizedBox(width: 16,),
                
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(posts![index].title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,
                      ),),
                      Text(posts![index].body??'',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },),
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
