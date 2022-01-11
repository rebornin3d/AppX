import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  var _value;

  @override
  Widget build(BuildContext context) {
    final maxLines = 5;
    var bodyText = Theme.of(context).textTheme.bodyText1!;
    return Scaffold(
      // backgroundColor: Color(0xFFE513333),
      appBar: AppBar(
        // backgroundColor: AppColors.primary,

        title: Text(
          'Create Post',
          style: bodyText.copyWith(fontSize: 18),
        ),
        actions: [IconButton(onPressed: () {}, icon: Text('Post'))],
        centerTitle: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                color: Color(0xFFE518598),
                width: 80.0,
                height: 80.0,
              ),
              ElevatedButton(
                onPressed: () {},
                child: DropdownButton(
                  value: _value,
                  items: [
                    DropdownMenuItem(
                      child: Text("Public"),
                      value: 1,
                    ),
                    DropdownMenuItem(
                      child: Text("Only friends"),
                      value: 2,
                    ),
                    DropdownMenuItem(child: Text("Third Item"), value: 3),
                    DropdownMenuItem(child: Text("Fourth Item"), value: 4),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _value = value;
                    });
                  },
                ),
              ),
            ],
          ),
          Text(
            'Whats on your mind? ',
            style: bodyText.copyWith(fontSize: 18),
          ),
          Container(
            margin: EdgeInsets.all(12),
            height: maxLines * 35.0,
            child: TextField(
              maxLines: maxLines,
              decoration: InputDecoration(
                hintText: "Whats on your mind?",
                fillColor: Colors.grey[300],
                filled: true,
              ),
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Add to your post ',
                  style: bodyText.copyWith(fontSize: 16),
                ),
              ),

              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.picture_in_picture_alt_rounded,
                  color: Colors.pink,
                  size: 24.0,
                ),
                label: Text(''), style: ElevatedButton.styleFrom(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20.0),
                ),
              ),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.tag_sharp,
                  color: Colors.pink,
                  size: 24.0,
                ),
                label: Text(''), style: ElevatedButton.styleFrom(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20.0),
                ),
              ),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.location_city,
                  color: Colors.pink,
                  size: 24.0,
                ),
                label: Text(''), style: ElevatedButton.styleFrom(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20.0),
                ),
              ),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.emoji_emotions,
                  color: Colors.pink,
                  size: 24.0,
                ),
                label: Text(''), style: ElevatedButton.styleFrom(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20.0),
                ),
              ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
