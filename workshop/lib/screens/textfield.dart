import 'package:flutter/material.dart';

class TextFieldProgram extends StatefulWidget {
  const TextFieldProgram({super.key});

  @override
  State<TextFieldProgram> createState() => _TextFieldScreenState();
}

class _TextFieldScreenState extends State<TextFieldProgram> {
  final TextEditingController textController = TextEditingController();

  String displayedText = '';

  void displayText() {
    setState(() {
      displayedText = textController.text;
    });
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TextField Program'),
        backgroundColor: Colors.deepPurple,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: textController,
              decoration: const InputDecoration(
                labelText: 'Enter your Name',
                hintText: 'Type........',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: displayText,
                child: const Text(
                  'Submit',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Text(
              displayedText,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}