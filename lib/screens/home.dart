import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sixthapp/constants/colors.dart';
import 'package:sixthapp/models/notes.dart';
import 'package:sixthapp/screens/edit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
List<Note> filteredNotes = [];

  @override
  initState() {
    super.initState();
    filteredNotes = sampleNotes;
  }

getRandomColor() {
  Random random = Random();
  return backgroundColors[random.nextInt(backgroundColors.length)];
}
void onSearchedTextChanged(String searchText) {
  setState(() {
    filteredNotes = sampleNotes
  .where((note) => 
  note.content.toLowerCase().contains(searchText.toLowerCase()) ||
  note.title.toLowerCase().contains(searchText.toLowerCase())  
  )
  .toList();
  });
  
}

void deleteNote(int index) {
    setState(() {
      Note note = filteredNotes[index];
      sampleNotes.remove(note);
      filteredNotes.removeAt(index);
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('To Do List', style: TextStyle(fontSize: 30, color: Colors.white),),
                IconButton(
                  onPressed: () {}, 
                  padding: EdgeInsets.all(0),
                  icon: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade800.withOpacity(.8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.sort, 
                      color: Colors.white,),
                      ))
              ],
            ),
            SizedBox(height: 20,),

             TextField(
              onChanged: onSearchedTextChanged,
              style: TextStyle(fontSize: 16,color: Colors.white),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 12),
                hintText: "Search notes...",
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: Icon(Icons.search, color: Colors.grey,),
                fillColor: Colors.grey.shade800.withOpacity(.8),
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: const BorderSide(color: Colors.transparent)),
              ),
            ),
            SizedBox(height: 16,),
            Expanded(child: ListView.builder(
              padding: EdgeInsets.only(top: 30),
              itemCount: filteredNotes.length,
              itemBuilder:(context, index) {
                return Card(
                  margin: const EdgeInsets.all(10),
                  color: getRandomColor(),
                  elevation: 4,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      onTap: () async {
                       final result = await Navigator.push(
          context, 
          MaterialPageRoute<void>(
          builder: (BuildContext context) => EditScreen(note: filteredNotes[index]),
        ),
        ); 
         
                      },
                      


                      title: RichText(
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        
                        text: TextSpan(
                        text: '${filteredNotes[index].title} \n',
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          height: 1.5
                        ),
                        children: [
                          TextSpan(
                            text: filteredNotes[index].content,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              height: 1.5,
                            )
                          )
                        ]
                      )
                      ),
                      
                      trailing: IconButton(onPressed: () {
                        deleteNote(index);
                      },
                      icon: const Icon(Icons.delete),
                      ),
                    ),
                  ),
                );
              },
              
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        final result = await Navigator.push(
          context, 
          MaterialPageRoute<void>(
          builder: (BuildContext context) => const EditScreen(),
        )
        );
        
          

        


      },
      elevation: 10,
      backgroundColor: Colors.grey.shade800,
      child: const Icon(Icons.add, size: 38,),),


    );
  }
}