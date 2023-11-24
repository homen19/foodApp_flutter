import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_first_project/pages/model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Home> {
  List<Post> samplePost = [];
  bool isContainerOpen = true;
  final userController = TextEditingController();
  final idController = TextEditingController();
  final titleController = TextEditingController();
  final bodyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
                Icons.menu), // Replace 'Icons.menu' with your desired icon
            onPressed: () {},
          ),
          actions: [
            IconButton(
              icon: isContainerOpen ? Icon(Icons.add) : Icon(Icons.close),
              onPressed: () {
                setState(() {
                  isContainerOpen = !isContainerOpen;
                });
              },
            ),
          ],
          title: const Text("Posts"),
          backgroundColor: Color(0xFF0174BE),
        ),
        body: isContainerOpen
            ? FutureBuilder(
                future: getData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: samplePost.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 250,
                          color: const Color(0xFFFFF0CE),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          margin: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'User id : ${samplePost[index].userId}',
                                style: const TextStyle(fontSize: 18),
                              ),
                              Text(
                                'Id : ${samplePost[index].id}',
                                style: const TextStyle(fontSize: 18),
                              ),
                              Text(
                                'Title : ${samplePost[index].title}',
                                style: const TextStyle(fontSize: 18),
                                maxLines: 1,
                              ),
                              Text(
                                'Body: ${samplePost[index].body}',
                                maxLines: 3,
                                style: const TextStyle(fontSize: 18),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: ElevatedButton(
                                        onPressed: () {}, child: Text("Edit")),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: ElevatedButton(
                                        style: const ButtonStyle(
                                            backgroundColor:
                                                MaterialStatePropertyAll(
                                                    Color(0xFFD80032))),
                                        onPressed: () {
                                          deleteData(samplePost[index].id);
                                        },
                                        child: const Text("Delete")),
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                })
            : Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextField(
                      controller: userController,
                      decoration: InputDecoration(labelText: 'User ID'),
                    ),
                    TextField(
                      controller: idController,
                      decoration: InputDecoration(labelText: 'ID'),
                    ),
                    TextField(
                      controller: titleController,
                      decoration: InputDecoration(labelText: 'Title'),
                    ),
                    TextField(
                      controller: bodyController,
                      decoration: InputDecoration(labelText: 'Body'),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        createData(
                          userId: int.parse(userController.text),
                          id: int.parse(idController.text),
                          title: titleController.text,
                          body: bodyController.text,
                        );

                        setState(() {
                          isContainerOpen = !isContainerOpen;
                        });
                      },
                      child: Text('Post'),
                    ),
                  ],
                ),
              ));
  }

  Future<List<Post>> getData() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        samplePost.add(Post.fromJson(index));
      }
      return samplePost;
    } else {
      return samplePost;
    }
  }

  Future<void> deleteData(int id) async {
    final response = await http.delete(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/$id'),
    );

    if (response.statusCode == 200) {
      setState(() {
        samplePost.removeWhere((post) => post.id == id);
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Success'),
            content: Text('Your id ${id} deleted successfully.'),
            actions: <Widget>[
              ElevatedButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      throw Exception("Failed to delete Data");
    }
  }

  Future<void> createData({
    required int userId,
    required int id,
    required String title,
    required String body,
  }) async {
    final response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, dynamic>{
          'userId': userId,
          'id': id,
          'title': title,
          'body': body,
        },
      ),
    );

    if (response.statusCode == 201) {
      final createdPost = Post.fromJson(jsonDecode(response.body));
      setState(() {
        samplePost.insert(0, createdPost);
      });

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Success'),
            content: Text('Data created successfully.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Failed to create data.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
}
