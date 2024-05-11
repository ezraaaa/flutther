import 'package:flutther/app/app.dart';
import 'package:flutther/bootstrap.dart';
import 'package:flutther/firebase_options/firebase_options.dart';

void main() {
  bootstrap(() => const App(), DefaultFirebaseOptionsStg.currentPlatform);
}
