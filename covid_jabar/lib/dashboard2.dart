import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'jabar_moderl.dart';
import 'covid_data_source.dart';
import 'package:covid_jabar/model/contact_list_model.dart';
import 'input_kota.dart';
import 'detail.dart';

class dashboard2 extends StatefulWidget {
  const dashboard2({Key? key}) : super(key: key);

  @override
  _dashboard2State createState() => _dashboard2State();
}

class _dashboard2State extends State<dashboard2> {

  //JabarModel datamodel;
  Box<ContactListModel> localDB = Hive.box<ContactListModel>("contact_list");

  @override
  Widget build(BuildContext context) {
    var jumlah = localDB.length;
    return Scaffold(
      appBar: AppBar(
        title: Text("Aplikasi Rekapitulasi COVID Jabar"),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Tambah Kota',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ContactList()));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Container(
                    child: localDB.length==0?
                            Container(
                                child: Center(
                                  child: Column(
                                    children: [
                                      Text("Data Kosong"),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ElevatedButton(
                                          onPressed: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => ContactList()));
                                          },
                                          child: Text("Pilih Kota"),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                            ):
                            Text("Jumlah Data : $jumlah")
                ),
              ),
              Column(
                children: [
                  for(var i=0 ; i < localDB.length ; i++)
                  _buildDetailCountriesBody(localDB.getAt(i)!.name),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailCountriesBody(kota) {
    return Container(
      child: FutureBuilder(
        future: CovidDataSource.instance.loadCountries(),
        builder: (
            BuildContext context,
            AsyncSnapshot<dynamic> snapshot,
            ) {
          if (snapshot.hasError) {
            return _buildErrorSection();
          }
          if (snapshot.hasData) {
            JabarModel countriesModel = JabarModel.fromJson(snapshot.data);
            return _buildSuccessSection(countriesModel,kota);
          }
          return _buildLoadingSection();
        },
      ),
    );
  }

  Widget _buildErrorSection() {
    return Text("Error");
  }

  Widget _buildEmptySection() {
    return Text("Empty");
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessSection(JabarModel data, kota) {
    return Container(
      height: 90,
      child: ListView.builder(
        itemCount: data.data!.content?.length,
        itemBuilder: (BuildContext context, int index) {
          if(data.data!.content?[index].namaKab == kota){
            var datadetail = {
              'nama' : data.data!.content?[index].namaKab,
              'kode' : data.data!.content?[index].kodeKab,
              'odpProses' : data.data!.content?[index].odpProses,
              'odpSelesai' : data.data!.content?[index].odpSelesai,
              'odpTotal' : data.data!.content?[index].odpTotal,
              'pdpProses' : data.data!.content?[index].pdpProses,
              'pdpSelesai' : data.data!.content?[index].pdpSelesai,
              'pdpTotal' : data.data!.content?[index].pdpTotal,
              'otgProses' : data.data!.content?[index].otgProses,
              'otgSelesai' : data.data!.content?[index].otgSelesai,
              'otgTotal' : data.data!.content?[index].otgTotal,
              'positif' : data.data!.content?[index].positif,
              'sembuh' : data.data!.content?[index].sembuh,
              'meninggal' : data.data!.content?[index].meninggal,
              'odpMeninggal' : data.data!.content?[index].odpMeninggal,
              'pdpMeninggal' : data.data!.content?[index].pdpMeninggal,
              'otgMeninggal' : data.data!.content?[index].otgMeninggal,

            };
            return ElevatedButton(
              onPressed: (){
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => detail(data: datadetail))
                );
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildItemCountries("${data.data!.content?[index].namaKab}"),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text("Positif : "),
                                  _buildItemCountries("${data.data!.content?[index].positif}"),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text("Sembuh : "),
                                  _buildItemCountries("${data.data!.content?[index].sembuh}"),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text("Meninggal : "),
                                  _buildItemCountries("${data.data!.content?[index].meninggal}"),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return SizedBox.shrink();
        },
      ),
    );

  }


  Widget _buildItemCountries(String value) {
    return Text(value);
  }

}


