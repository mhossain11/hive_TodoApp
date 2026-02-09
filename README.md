# cach_hive

A new Flutter project.

## Getting Started

Hive হল Flutter এর local key-value database।
----------------------------------------------
Hive custom class সরাসরি save করতে পারে না
আগে TypeAdapter register করতে হয়
DataModel এ Hive annotation
typeId unique হতে হবে (0,1,2...)
---------------------------------------
#flutter pub run build_runner build
এটা data_model.g.dart বানাবে
-----------------------------------
void main() async {
WidgetsFlutterBinding.ensureInitialized();
await Hive.initFlutter();

Hive.registerAdapter(DataModelAdapter()); // 🔥 this line

runApp(const MyApp());
}
main.dart এ adapter register করো

----------------------------------------

final box = await Hive.openBox<DataModel>('dataBox');

box.add(DataModel(title: "Hello Hive"));
Box open করে save করো