import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    double wt = MediaQuery.of(context).size.width;
    double ht = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leadingWidth: 20,

        // automaticallyImplyLeading: true,
        leading: Icon(Icons.list_rounded),
        backgroundColor: Colors.white,
        title: RichText(
          text: TextSpan(
            text: "FAITH",
            style: TextStyle(
              color: Colors.amber,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(
                text: 'BOOK',
                style: TextStyle(
                  color: Colors.green[900],
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        actions: [
          SizedBox(
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white,
                    border: Border.all(width: 0.3),
                  ),

                  child: Icon(Icons.add),
                ),
                SizedBox(width: 4),
                Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    'CHAT',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(thickness: 1.4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                Column(children: [Text('421'), Text('Posts')]),
                Column(children: [Text('236'), Text('Followers')]),
                Column(children: [Text('2873'), Text('Followings')]),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                SizedBox(width: 14),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Jaya Arockya Mary Gabrial ',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text('@username123', style: TextStyle(color: Colors.black)),
                  ],
                ),
              ],
            ),
            Divider(),
            Row(
              children: [
                SizedBox(width: 14),
                Flexible(
                  child: Text(
                    'AGRA REGION > ALLAHABAD DIOCESE > ST. JOSEPH THE WORKER CHURCH, CHUAKERI',

                    softWrap: true,
                    overflow: TextOverflow.visible,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(width: 14),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[900],
                  ),
                  onPressed: () {},
                  child: Text(
                    'Edit Profile',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(width: 10),
                OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    'View Profile',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
            Divider(),
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.black,

                      radius: 22,
                      child: Container(
                        height: ht * 0.1,
                        width: wt * 0.1,

                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    title: Text(
                      'Jaya Arockya Mary Gabriel',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      '19 min ago',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.more_vert),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: ht * 0.35,
              child: Container(
                decoration: BoxDecoration(color: Colors.amber),
                child: Center(child: Text('Image')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
