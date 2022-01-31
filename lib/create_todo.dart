import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:get/get.dart';

class CreateToDo extends StatelessWidget {
  CreateToDo({Key? key}) : super(key: key);
  final DateFormat _dateFormat = DateFormat("dd/MM/yyyy");
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create To Do'),
      ),
      body: Form(
        key: _formkey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: _titleController,
                maxLines: 1,
                decoration: const InputDecoration(
                  label: Text(
                    'Title',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  hintText: ('Please enter a title'),
                  hintStyle: TextStyle(fontSize: 12),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'title is a required field';
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: _descriptionController,
                maxLines: 1,
                decoration: const InputDecoration(
                  label: Text(
                    'Description',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  hintText: ('Please enter a description'),
                  hintStyle: TextStyle(fontSize: 12),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'description is a required field';
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      onTap: () {
                        showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime.now()
                                    .add(const Duration(days: 365)))
                            .then((selectedDate) {
                          _dateController.text =
                              _dateFormat.format(selectedDate!);
                        });
                      },
                      controller: _dateController,
                      maxLines: 1,
                      decoration: const InputDecoration(
                        label: Text(
                          'Date',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        hintText: ('Please enter the date'),
                        hintStyle: TextStyle(fontSize: 12),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'date is a required field';
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  Expanded(
                    child: TextFormField(
                      onTap: () {
                        showTimePicker(
                                context: context, initialTime: TimeOfDay.now())
                            .then((selectedtime) {
                          _timeController.text = selectedtime!.format(context);
                        });
                      },
                      controller: _timeController,
                      maxLines: 1,
                      decoration: const InputDecoration(
                        label: Text(
                          'Time',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        hintText: ('Please enter the time'),
                        hintStyle: TextStyle(fontSize: 12),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'time is a required field';
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      // print('success');
                    } else {
                      // print('failed');
                    }
                  },
                  child: const Text(
                    'Create',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
