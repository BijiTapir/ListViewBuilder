import 'package:flutter/material.dart';
import 'package:list_view/data.dart';

class listView extends StatefulWidget {
  const listView({Key? key}) : super(key: key);

  @override
  State<listView> createState() => _listViewState();
}

class _listViewState extends State<listView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Daftar Kontak"),
      // ),
        body: ListView.builder(
          itemCount: users.length,
          itemBuilder: ((BuildContext context, int index) {
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(users[index].images),
                ),
                title: Text(users[index].name),
                subtitle: Text(users[index].number),
                onLongPress: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Peringatan!'),
                    content: const Text('Yakin Ingin Menghapus Pesan?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Batal'),
                        child: const Text('Batal'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context, 'Hapus');
                          setState(() {
                            users.remove(users[index]);
                          });
                        },
                        child: const Text('Hapus'),
                        // onPressed: () => Navigator.pop(context, 'OK'),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ));
  }
}