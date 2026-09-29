import 'package:flutter/material.dart';

class FormControlsProgram extends StatefulWidget {
    const FormControlsProgram({super.key});

    @override
    State<FormControlsProgram> createState() => _FormControlsProgramState();
}

class _FormControlsProgramState extends State<FormControlsProgram> {
    final TextEditingController nameController = TextEditingController();

    String gender = 'Male';
    bool isStudent = false;
    bool readings = false;
    bool music = false;
    bool sports = false;
    String selectedCourse = 'Flutter';

    void submitForm() {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FormResultPage(
                    name: nameController.text,
                    gender: gender,
                    isStudent: isStudent,
                    readings: readings,
                    music: music,
                    sports: sports,
                    course: selectedCourse,
                ),
            ),
        );
    }

    @override
    void dispose() {
        nameController.dispose();
        super.dispose();
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('Form Controls'),
                backgroundColor: Colors.green,
            ),
            body: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                        const Text(
                            'Name',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                            ),
                        ),

                        const SizedBox(height: 10),

                        TextField(
                            controller: nameController,
                            decoration: const InputDecoration(
                                labelText: 'Enter your Name:',
                                hintText: 'Type something..',
                                border: OutlineInputBorder(),
                            ),
                        ),

                        const SizedBox(height: 25),

                        const Text(
                            'Gender',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                            ),
                        ),

                        RadioListTile<String>(
                            title: const Text('Male'),
                            value: 'Male',
                            groupValue: gender,
                            onChanged: (value) {
                                setState(() {
                                    gender = value!;
                                });
                            },
                        ),

                        RadioListTile<String>(
                            title: const Text('Female'),
                            value: 'Female',
                            groupValue: gender,
                            onChanged: (value) {
                                setState(() {
                                    gender = value!;
                                });
                            },
                        ),

                        RadioListTile<String>(
                            title: const Text('Other'),
                            value: 'Other',
                            groupValue: gender,
                            onChanged: (value) {
                                setState(() {
                                    gender = value!;
                                });
                            },
                        ),

                        const SizedBox(height: 10),

                        CheckboxListTile(
                            title: const Text('I am a Student'),
                            value: isStudent,
                            onChanged: (value) {
                                setState(() {
                                    isStudent = value!;
                                });
                            },
                        ),

                        const SizedBox(height: 10),

                        const Text(
                            'Hobbies',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                            ),
                        ),

                        CheckboxListTile(
                            title: const Text('Reading'),
                            value: readings,
                            onChanged: (value) {
                                setState(() {
                                    readings = value!;
                                });
                            },
                        ),

                        CheckboxListTile(
                            title: const Text('Music'),
                            value: music,
                            onChanged: (value) {
                                setState(() {
                                    music = value!;
                                });
                            },
                        ),

                        CheckboxListTile(
                            title: const Text('Sports'),
                            value: sports,
                            onChanged: (value) {
                                setState(() {
                                    sports = value!;
                                });
                            },
                        ),

                        const SizedBox(height: 15),

                        const Text(
                            'Select Course',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                            ),
                        ),

                        const SizedBox(height: 10),

                        DropdownButtonFormField<String>(
                            value: selectedCourse,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Course',
                            ),
                            items: [
                                'Flutter',
                                'Python',
                                'Java',
                                'Web Development',
                            ].map((course) {
                                return DropdownMenuItem<String>(
                                    value: course,
                                    child: Text(course),
                                );
                            }).toList(),
                            onChanged: (value) {
                                setState(() {
                                    selectedCourse = value!;
                                });
                            },
                        ),

                        const SizedBox(height: 30),

                        Center(
                            child: SizedBox(
                                width: 200,
                                height: 55,
                                child: ElevatedButton(
                                    onPressed: submitForm,
                                    child: const Text(
                                        'Submit',
                                        style: TextStyle(
                                            fontSize: 18,
                                        ),
                                    ),
                                ),
                            ),
                        ),

                        const SizedBox(height: 20),
                    ],
                ),
            ),
        );
    }
}


class FormResultPage extends StatelessWidget {
    final String name;
    final String gender;
    final bool isStudent;
    final bool readings;
    final bool music;
    final bool sports;
    final String course;

    const FormResultPage({
        super.key,
        required this.name,
        required this.gender,
        required this.isStudent,
        required this.readings,
        required this.music,
        required this.sports,
        required this.course,
    });

    @override
    Widget build(BuildContext context) {

        List<String> selectedHobbies = [];

        if (readings) {
            selectedHobbies.add('Reading');
        }

        if (music) {
            selectedHobbies.add('Music');
        }

        if (sports) {
            selectedHobbies.add('Sports');
        }

        return Scaffold(
            appBar: AppBar(
                title: const Text('Submitted details'),
                backgroundColor: Colors.green,
            ),
            body: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                        Text(
                            'Name: $name',
                            style: const TextStyle(
                                fontSize: 18,
                            ),
                        ),

                        const SizedBox(height: 10),

                        Text(
                            'Gender: $gender',
                            style: const TextStyle(
                                fontSize: 18,
                            ),
                        ),

                        const SizedBox(height: 10),

                        Text(
                            'Student: ${isStudent ? "Yes" : "No"}',
                            style: const TextStyle(
                                fontSize: 18,
                            ),
                        ),

                        const SizedBox(height: 10),

                        Text(
                            'Hobbies: ${selectedHobbies.join(", ")}',
                            style: const TextStyle(
                                fontSize: 18,
                            ),
                        ),

                        const SizedBox(height: 10),

                        Text(
                            'Course: $course',
                            style: const TextStyle(
                                fontSize: 18,
                            ),
                        ),
                    ],
                ),
            ),
        );
    }
}