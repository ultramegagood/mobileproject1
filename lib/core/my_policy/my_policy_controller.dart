import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:mobile_nsk/models/policy/archive_policy.dart';
import 'package:mobile_nsk/repository/calculator/main/user_data.dart';
import 'package:mobile_nsk/repository/calculator/policy/policy_repository/policy_repository.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class MyPolicyController extends GetxController {
  var items = Rx<List<bool>>([]);
  var loadRx = false.obs;
  var archive = Rxn<ArchivePolicy>();
  var activePolicies = Rxn<List>();

  final PolicyRepository _repository = PolicyRepository();

  @override
  void onInit() async {
    loadRx(true);
    await Future.delayed(const Duration(seconds: 1)).then(
      (value) => items(List.generate(2, (index) => false)),
    );
    archive(await _repository.getMyExpiredPolicy());
    activePolicies(await _repository.getMyActivePolicy());
    log('Active policies: ' + activePolicies.value.toString());
    loadRx(false);
    super.onInit();
  }

  void setSelected(int index) {
    for (int buttonIndex = 0; buttonIndex < items.value.length; buttonIndex++) {
      if (buttonIndex == index) {
        items.value[buttonIndex] = true;
      } else {
        items.value[buttonIndex] = false;
      }
      items.refresh();
    }
  }

  Future openFile(String name, int index) async {
    final file = await downloadFile(name, index);
    if (file == null) return;
    log('Path: ' + file.path);
    OpenFile.open(file.path );
  }

  Future<File?> downloadFile(String name, int index) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final file = File('${appStorage.path}/$name ');
    try {
      final token = await UserData().getToken();
    final id = archive.value!.policies![index].id;
    final response = await http.get(
      Uri.parse(
          "https://online.nsk.kz/net-service/api/polisPdf?id=$id&amp;token=$token"),
    );
    final raf = file.openSync(mode: FileMode.write);
    raf.writeFromSync(response.bodyBytes);
    await raf.close();
    return file;
    } catch (e) {
      return null ;
    }
  }
}
