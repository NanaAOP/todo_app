import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:todo_app/create_todo.dart';
import 'package:todo_app/utils.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String selectedItem = 'todo';

  final List<Map<String, dynamic>> unCompleteddata = [];

  final List<Map<String, dynamic>> completedData = [];

  final List<Map<String, dynamic>> data = [
    {
      'title': 'Flutter Web',
      'description':
          'Many modern alternatives often incorporate humor or other content that actually detracts from the primary purpose of filler text: to be unobtrusive, yet provide the feel, look, and texture of filler text',
      'date_time': 'Yesterday',
      'status': false
    },
    {
      'title': 'Study Flutter',
      'description':
          'Many modern alternatives often incorporate humor or other content that actually detracts from the primary purpose of filler text: to be unobtrusive, yet provide the feel, look, and texture of filler text',
      'date_time': 'Today',
      'status': true
    },
    {
      'title': 'Dart Language',
      'description':
          'Many modern alternatives often incorporate humor or other content that actually detracts from the primary purpose of filler text: to be unobtrusive, yet provide the feel, look, and texture of filler text',
      'date_time': 'Mon, 20 Jan',
      'status': false
    },
    {
      'title': 'Tour',
      'description':
          'Many modern alternatives often incorporate humor or other content that actually detracts from the primary purpose of filler text: to be unobtrusive, yet provide the feel, look, and texture of filler text',
      'date_time': 'Tommorow',
      'status': true
    },
    {
      'title': 'Flutter Framework ',
      'description':
          'Many modern alternatives often incorporate humor or other content that actually detracts from the primary purpose of filler text: to be unobtrusive, yet provide the feel, look, and texture of filler text',
      'date_time': 'Thursday',
      'status': false
    },
    {
      'title': 'Dynamic creating',
      'description':
          'Many modern alternatives often incorporate humor or other content that actually detracts from the primary purpose of filler text: to be unobtrusive, yet provide the feel, look, and texture of filler text',
      'date_time': 'Friday',
      'status': true
    },
    {
      'title': 'Website Creation',
      'description':
          'Many modern alternatives often incorporate humor or other content that actually detracts from the primary purpose of filler text: to be unobtrusive, yet provide the feel, look, and texture of filler text',
      'date_time': 'Next Week',
      'status': true
    }
  ];

  @override
  void initState() {
    for (Map<String, dynamic> element in data) {
      if (element['status']) {
        unCompleteddata.add(element);
      } else {
        if (!element['status']) {
          completedData.add(element);
        }
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(6.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1639502496516-95531e23e304?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=465&q=80'),
          ),
        ),
        title: const Text(
          'My Tasks',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              setState(() {
                selectedItem = '$value';
              });
            },
            icon: const Icon(Icons.menu),
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  child: Text('Todo'),
                  value: 'todo',
                ),
                const PopupMenuItem(
                  child: Text('Completed'),
                  value: 'completed',
                )
              ];
            },
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(CreateToDo());
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 50,
        ),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Icon(Icons.check_circle_outline_outlined,
                        color: customerColor(
                            date: selectedItem == 'todo'
                                ? unCompleteddata[index]['date_time']
                                : completedData[index]['date_time'])),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            selectedItem == 'todo'
                                ? unCompleteddata[index]['title']
                                : completedData[index]['title'],
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text(
                            selectedItem == 'todo'
                                ? unCompleteddata[index]['description']
                                : completedData[index]['description'],
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Icon(
                          Icons.notifications,
                          color: customerColor(
                              date: selectedItem == 'todo'
                                  ? unCompleteddata[index]['date_time']
                                  : completedData[index]['date_time']),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                        ),
                        Text(
                            selectedItem == 'todo'
                                ? unCompleteddata[index]['date_time']
                                : completedData[index]['date_time'],
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: customerColor(
                                    date: selectedItem == 'todo'
                                        ? unCompleteddata[index]['date_time']
                                        : completedData[index]['date_time'])))
                      ],
                    )
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 5,
            );
          },
          itemCount: selectedItem == 'todo'
              ? unCompleteddata.length
              : completedData.length),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              showBarModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return ListView.separated(
                        itemBuilder: (context, index) {
                          return Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  const Icon(
                                      Icons.check_circle_outline_outlined),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          completedData[index]['title'],
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                        Text(
                                          completedData[index]['description'],
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(fontSize: 15),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  Row(
                                    children: [
                                      const Icon(Icons.notifications),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                      ),
                                      Text(data[index]['date_time'],
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: customerColor(
                                                  date: unCompleteddata[index]
                                                      ['date_time'])))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 5,
                          );
                        },
                        itemCount: completedData.length);
                  });
            },
            child: Material(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              color: const Color.fromRGBO(29, 38, 104, 1),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.check_circle,
                      size: 30,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      'Completed',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    const Spacer(),
                    Text(
                      '${completedData.length}',
                      style: const TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
