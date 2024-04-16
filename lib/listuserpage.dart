import 'package:flutter/material.dart';

// Definisi model pengguna
class User {
  final String name;
  final String profilePicture;
  final String status;

  User({
    required this.name,
    required this.profilePicture,
    required this.status,
  });
}

// Daftar pengguna (Anda dapat mengganti dengan data pengguna nyata)
final List<User> userData = [
  User(
    name: 'Ariskiswan',
    profilePicture: 'https://www.w3schools.com/howto/img_avatar.png',
    status: 'Online',
  ),
  User(
    name: 'Srikheart',
    profilePicture: 'https://www.w3schools.com/howto/img_avatar2.png',
    status: 'Offline',
  ),
  User(
    name: 'Greesa Angrasa',
    profilePicture: 'https://www.w3schools.com/howto/img_avatar2.png',
    status: 'Offline',
  ),
  User(
    name: 'Anggasrini',
    profilePicture: 'https://www.w3schools.com/howto/img_avatar2.png',
    status: 'Online',
  ),
  User(
    name: 'Ogyaestu',
    profilePicture: 'https://www.w3schools.com/w3images/avatar2.png',
    status: 'Offline',
  ),
  // Tambahkan lebih banyak data pengguna di sini jika diinginkan
];

class ListUserPage extends StatefulWidget {
  @override
  _ListUserPageState createState() => _ListUserPageState();
}

class _ListUserPageState extends State<ListUserPage> {
  bool isContacting = false; // Status apakah pengguna sedang membuat kontak

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Other Users'),
      ),
      body: Column(
        children: [
          // Kolom pencarian ditempatkan di bawah "Other Users"
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: TextField(
              controller: TextEditingController(),
              decoration: InputDecoration(
                hintText: 'Cari...',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          // ListView untuk daftar pengguna
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                itemCount: userData.length,
                itemBuilder: (context, index) {
                  final user = userData[index];
                  return Card(
                    elevation: 4,
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(user.profilePicture),
                        backgroundColor: Colors.grey[300],
                        radius: 25,
                      ),
                      title: Text(
                        user.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Text(
                        user.status,
                        style: TextStyle(
                          color: user.status == 'Online'
                              ? Colors.green
                              : Colors.red,
                        ),
                      ),
                      trailing: Icon(
                        Icons.circle,
                        color:
                            user.status == 'Online' ? Colors.green : Colors.red,
                        size: 16,
                      ),
                      onTap: () {
                        // Tambahkan aksi saat item daftar ditekan
                      },
                    ),
                  );
                },
              ),
            ),
          ),
          // Row untuk ikon dengan keterangan di bawah layar
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.home),
                      onPressed: () {
                        // Tambahkan aksi untuk tombol home
                      },
                    ),
                    Text('Home'),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.person,
                        size: 30, // Mengubah ukuran ikon menjadi lebih besar
                      ),
                      color: isContacting
                          ? Colors.blue
                          : Colors.black, // Mengubah warna ikon saat kontak
                      onPressed: () {
                        // Tambahkan aksi untuk tombol user
                        setState(() {
                          // Ubah status kontak saat ikon ditekan
                          isContacting = !isContacting;
                        });
                      },
                    ),
                    Text(
                      'User',
                      style: TextStyle(
                        color: isContacting
                            ? Colors.blue
                            : Colors.black, // Mengubah warna teks saat kontak
                        fontWeight:
                            FontWeight.bold, // Mengubah teks menjadi bold
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.inbox),
                      onPressed: () {
                        // Tambahkan aksi untuk tombol inbox
                      },
                    ),
                    Text('Inbox'),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.settings),
                      onPressed: () {
                        // Tambahkan aksi untuk tombol settings
                      },
                    ),
                    Text('Settings'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
