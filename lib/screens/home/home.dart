import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tp_calculate/config/palette.dart';
import 'package:tp_calculate/providers/result_provider.dart';

import 'calculate_form.dart';

class HomeScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final result = useProvider(resultNotifierProvider);
    final isLoading = useState(false);

    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: Text("TP Calculate"),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Builder(
                  builder: (context) => IconButton(
                      icon: Icon(Icons.photo_library_outlined),
                      onPressed: isLoading.value
                          ? null
                          : () {
                              print("写真選択ボタンが押された");
                              isLoading.value = true;

                              final picker = ImagePicker();

                              picker.getImage(source: ImageSource.gallery).then(
                                (pickedFile) {
                                  // 送信処理
                                  print(pickedFile.path);

                                  result
                                      .postImage(pickedFile.path)
                                      .then((value) {
                                    print("画像をセット開始");
                                    print(result.state);

                                    Scaffold.of(context).showSnackBar(SnackBar(
                                      // 画像の読み込みに成功した時のメッセージ
                                      //TODO localize
                                      content: Text("画像の読み込みに成功しました。", textAlign: TextAlign.center,),
                                      backgroundColor: Palette.success,
                                      duration: Duration(seconds: 3),
                                    ));
                                  }).catchError((e) {
                                    print(e);
                                    print("リザルトではない画像が選ばれました");

                                    Scaffold.of(context).showSnackBar(SnackBar(
                                      // 画像の読み込みにした時のメッセージ
                                      //TODO localize
                                      content: Text("正しく画像が読み込めませんでした。", textAlign: TextAlign.center,),
                                      backgroundColor: Palette.failed,
                                      duration: Duration(seconds: 5),
                                    ));
                                  }).whenComplete(() {
                                    isLoading.value = false;
                                  });
                                },
                              ).catchError((e) => isLoading.value = false);
                            }),
                ),
              )
            ],
          ),
          body: Container(
            padding: EdgeInsets.all(16),
            child: CalculateForm(),
          ),
        ),
        isLoading.value
            ? Container(
                decoration: new BoxDecoration(
                  color: Color.fromRGBO(0, 0, 0, 0.6),
                ),
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              )
            : Container()
      ],
    );
  }
}