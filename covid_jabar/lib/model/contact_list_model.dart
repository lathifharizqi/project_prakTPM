import 'package:hive/hive.dart';

part 'contact_list_model.g.dart';

@HiveType(typeId: 1)
class ContactListModel extends HiveObject{

  ContactListModel({required this.name});

  @HiveField(0)
  String name;

  @override
  String toString() {
    return 'ContactListModel{name: $name}';
  }
}