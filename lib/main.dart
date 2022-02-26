import 'package:flutter/cupertino.dart';

import 'insta_war.dart';
import 'package:flutter/material.dart';

void main() {
  const app = MyApp();
  runApp(app);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // callback method
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'war',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      home: Test(),
    );
  }
}

class Test extends StatelessWidget {
  Test({Key? key}) : super(key: key);

  final List<Instawar> InwarList = [
    Instawar(
        imUser: 'images/biden.jpg',
        impost: 'images/usa.jpg',
        Userpost: 'Joestar Biden',
        ments: [
          Comments(user: 'Prayut Chan-uncarn', comment: "Hello Monday🌹"),
          Comments(user: 'Pustin Valardim', comment: 'I will send missile🚀 to this place')
        ],
        caption: "please visit my Country☕"),
    Instawar(
        imUser: 'images/Putin.jpg',
        impost: 'images/war.jpg',
        Userpost: 'Pustin Valardim',
        ments: [
          Comments(user: 'Prayut Chan-uncarn', comment: "What's that!,It's look pretty cool"),
          Comments(user: 'Joestar Biden', comment: 'Oh no')
        ],
        caption: "Let's start 😎😎😎"),
    Instawar(
        imUser: 'images/prayut.jpg',
        impost: 'images/aitplane.jfif',
        Userpost: 'Prayut Chan-uncarn',
        ments: [
          Comments(user: 'Pustin Valardim', comment: "get my 2nd hand from me 80%off"),
          Comments(user: 'Joestar Biden', comment: 'You can get it, if you come to my country')
        ],
        caption: "I want that"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen.shade900,
      appBar: AppBar(
          title: Text('InstaWAR',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              ))),
      body: ListView.builder(
          itemCount: InwarList.length,
          itemBuilder: (context, index) => MyCard(war: InwarList[index])),
    );
  }
}

class MyCard extends StatefulWidget {
  final Instawar war;

  const MyCard({
    Key? key,
    required this.war,
  }) : super(key: key);

  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  final controller = TextEditingController();
  var like = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      margin: EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Text(covid.date),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 23,
                  backgroundImage: AssetImage('${widget.war.imUser}'),
                ),
                SizedBox(width: 10.0),
                Expanded(child: Text('${widget.war.Userpost}')),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_vert),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                '${widget.war.impost}',
                fit: BoxFit.cover,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                /*SizedBox(width: 5.0),*/
                Expanded(child: Text('${widget.war.caption}'))
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(bottom: 10.0, left: 16.0, right: 16.0),
            child: Column(
              children: [
                for (int i = 0; i < widget.war.ments.length; i++)
                  Row(
                    children: [
                      SizedBox(
                        height: 23.0,
                      ),
                      Text(
                        '${widget.war.ments[i].user}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade800,
                          fontSize: 15.0,
                        ),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        '${widget.war.ments[i].comment}',
                        style: TextStyle(),
                      )
                    ],
                  ),
              ],
            ),
          ),

          Row(
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    like = !like;
                  });
                },
                icon: like
                    ? Icon(
                        Icons.favorite,
                        color: Colors.pink,
                      )
                    : Icon(Icons.favorite_border),
              ),
              Expanded(
                child: TextField(
                  onSubmitted: (value) {
                    setState(() {
                      widget.war.ments
                          .add(Comments(user: 'Me', comment: value));
                      controller.clear();
                    });
                  },
                  controller: controller,
                  decoration: const InputDecoration(
                    hintText: 'Add a comment',
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
