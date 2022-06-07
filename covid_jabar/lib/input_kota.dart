import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:covid_jabar/model/contact_list_model.dart';
import 'package:covid_jabar/tools/common_submit_button.dart';
import 'dashboard2.dart';

class ContactList extends StatefulWidget {
  const ContactList({Key? key}) : super(key: key);

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  Box<ContactListModel> localDB = Hive.box<ContactListModel>("contact_list");

  TextEditingController _inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hive Database"),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            _buildInputField(),
            _buildSubmitButton(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: _backButton(),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0,10,0,20),
              child: Text(
                  "Data Kota : ",
                  textAlign: TextAlign.left,
              ),
            ),
            _buildList()
          ],
        ),
      ),
    );
  }

  Widget _backButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => dashboard2()));
        },
        child: Text("Kembali ke Dashboard"),
      ),
    );
  }

  var _dropDownValue;

  Widget _buildInputField() {
     return DropdownButton(
      hint: _dropDownValue == null
          ? Text('Pilih Kabupaten/Kota')
          : Text(
        _dropDownValue,
        style: TextStyle(color: Colors.blue),
      ),
      isExpanded: true,
      iconSize: 30.0,
      style: TextStyle(color: Colors.blue),
      items: ['Kabupaten Bandung', 'Kabupaten Bandung Barat', 'Kabupaten Bekasi', 'Kabupaten Bogor', 'Kabupaten Ciamis'
        , 'Kabupaten Cianjur', 'Kabupaten Cirebon', 'Kabupaten Garut', 'Kabupaten Indramayu', 'Kabupaten Karawang'
        , 'Kabupaten Kuningan', 'Kabupaten Majalengka', 'Kabupaten Pangandaran', 'Kabupaten Purwakarta', 'Kabupaten Subang'
        , 'Kabupaten Sukabumi', 'Kabupaten Sumedang', 'Kabupaten Tasikmalaya', 'Kota Bandung', 'Kota Banjar', 'Kota Bekasi'
        , 'Kota Bogor', 'Kota Cimahi', 'Kota Cirebon', 'Kota Depok', 'Kota Sukabumi', 'Kota Tasikmalaya'].map(
            (val) {
          return DropdownMenuItem<String>(
            value: val,
            child: Text(val),
          );
        },
      ).toList(),
      onChanged: (val) {
        setState(
              () {
            _dropDownValue = val;
            _inputController.text = _dropDownValue;
          },
        );
      },
    );
  }

  Widget _buildSubmitButton() {
    return CommonSubmitButton(
        labelButton: "Tambah Data",
        submitCallback: (value) {
          localDB.add(ContactListModel(name: _inputController.text));
          _inputController.clear();
          setState(() {});
        });
  }

  Widget _buildList() {
    return Expanded(
      child: ValueListenableBuilder(
          valueListenable: localDB.listenable(),
          builder: (BuildContext context, Box<dynamic> value, Widget? child) {
            if (value.isEmpty) {
              return Center(
                child: Text("Data Kosong"),
              );
            }

            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                ContactListModel? res = localDB.getAt(index);
                return Dismissible(
                  background: Container(
                    color: Colors.red,
                  ),
                  key: UniqueKey(),
                  onDismissed: (direction) {
                    res!.delete();
                  },
                  child: ListTile(
                    title: Text("${index+1}.${localDB.getAt(index)!.name}"),
                  //  subtitle: Text(res.authors),
                  ),
                );
                return Text("${index+1}.${localDB.getAt(index)!.name}");
              },
              itemCount: localDB.length,
            );
          }),
    );
  }
}