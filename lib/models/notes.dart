class Note {
  int id;
  String title;
  String content;
  DateTime modifiedTime;

  Note({
    required this.id,
    required this.title,
    required this.content,
    required this.modifiedTime,
  });
}


List<Note> sampleNotes = [
  Note(
    id: 0,
    title: 'Add your most important events',
    content:
        'I remember better than your perplexed mind.\nIf you are new here please Subscribe',
    modifiedTime: DateTime(2022,1,1,34,5),
  ),
  Note(
    id: 1,
    title: 'yes, anything can be added',
    content:
        '1. A recipe- Chicken Alfredo\n2. Vegan chili\n3. Spaghetti carbonara\n4. Chocolate lava cake',
    modifiedTime: DateTime(2022,1,1,34,5),
  ),
  Note(
    id: 2,
    title: 'Books to Read',
    content:
        '1. To Kill a Mockingbird\n2. 1984\n3. The Great Gatsby\n4. The Catcher in the Rye',
    modifiedTime: DateTime(2023,3,1,19,5),
  ),
  Note(
    id: 3,
    title: 'Gift Ideas for Mom',
    content: '1. Jewelry box\n2. Cookbook\n3. Scarf\n4. Spa day gift card',
   modifiedTime: DateTime(2023,1,4,16,53),
  ),
  
];
