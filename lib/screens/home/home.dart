import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tp_calculate/config/palette.dart';
import 'package:tp_calculate/domain/result_repository/model/result_model.dart';
import 'package:tp_calculate/domain/result_repository/model/result_model_factory.dart';
import 'package:tp_calculate/providers/result_provider.dart';

final blackPerfectTextController = new TextEditingController();
final tpTextController = new TextEditingController();
final perfectTextController = new TextEditingController();
final goodTextController = new TextEditingController();
final badTextController = new TextEditingController();
final missTextController = new TextEditingController();

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
                child: IconButton(
                    icon: Icon(Icons.photo_library_outlined),
                    onPressed: () {
                      print("写真選択ボタンが押された");
                      isLoading.value = true;

                      final picker = ImagePicker();

                      picker.getImage(source: ImageSource.gallery).then(
                        (pickedFile) {
                          // 送信処理
                          print(pickedFile.path);

                          result.postImage(pickedFile.path).then((value) {
                            print("画像をセット開始");
                            print(result.state);

                            tpTextController.text = result.state.tp.toString();
                            perfectTextController.text =
                                result.state.perfect.toString();
                            goodTextController.text =
                                result.state.good.toString();
                            badTextController.text =
                                result.state.bad.toString();
                            missTextController.text =
                                result.state.miss.toString();
                            blackPerfectTextController.text =
                                result.state.blackPerfect.toString();
                          }).catchError((e) {
                            print("リザルトではない画像が選ばれました");
                          }).whenComplete(() {
                            isLoading.value = false;
                          });
                        },
                      ).catchError((e) => isLoading.value = false);
                    }),
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

// Molecules
// ・有効性の確認
// ・リクエスト等
class CalculateForm extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final valueTextFormatter = <TextInputFormatter>[
      FilteringTextInputFormatter.digitsOnly
    ];

    final result = useProvider(resultNotifierProvider);
    ResultModel resultState = result.state;

    final setTextField = () {
      print("テキストフィールドセット");

      resultState = resultState.copyWith(
        tp: double.parse(
            tpTextController.text == "" ? "0" : tpTextController.text),
        perfect: int.parse(perfectTextController.text == ""
            ? "0"
            : perfectTextController.text),
        good: int.parse(
            goodTextController.text == "" ? "0" : perfectTextController.text),
        bad: int.parse(
            badTextController.text == "" ? "0" : perfectTextController.text),
        miss: int.parse(
            missTextController.text == "" ? "0" : perfectTextController.text),
      );
    };

    final onClear = () {
      tpTextController.text = "";
      perfectTextController.text = "";
      goodTextController.text = "";
      badTextController.text = "";
      missTextController.text = "";
      blackPerfectTextController.text = "";
    };

    return ListView(
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                child: CalculateTextField(
                  label: "TP値",
                  controller: tpTextController,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(),
            )
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                child: CalculateTextField(
                  label: "PERFECT",
                  labelColor: Palette.perfect,
                  inputFormatter: valueTextFormatter,
                  controller: perfectTextController,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                child: CalculateTextField(
                  label: "GOOD",
                  labelColor: Palette.good,
                  inputFormatter: valueTextFormatter,
                  controller: goodTextController,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                child: CalculateTextField(
                  label: "BAD",
                  labelColor: Palette.bad,
                  inputFormatter: valueTextFormatter,
                  controller: badTextController,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                child: CalculateTextField(
                  label: "MISS",
                  inputFormatter: valueTextFormatter,
                  controller: missTextController,
                ),
              ),
            ),
          ],
        ),

        // ボタン群
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  child: Text("計算"),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  textColor: Palette.white,
                  color: Palette.primary,
                  onPressed: () {
                    setTextField();

                    result.calculate();

                    print(resultState);

                    blackPerfectTextController.text =
                        resultState.blackPerfect.toString();

                    resultState = ResultModelFactory.create();
                  },
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  child: Text("リセット"),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      side: BorderSide(color: Palette.black)),
                  color: Palette.white,
                  onPressed: () {
                    onClear();
                  },
                ),
              ),
            ),

            // ボタン右のスペース
            Expanded(
              flex: 1,
              child: Container(),
            ),
          ],
        ),

        // 線
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Divider(
            color: Colors.black,
          ),
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: CalculateTextField(
                  label: "PERFECT(Black)",
                  controller: blackPerfectTextController,
                  isEnabled: false,
                ),
              ),
            ),
            // 右の空白
            Expanded(
              flex: 2,
              child: Container(),
            )
          ],
        ),
      ],
    );
  }
}

// Atoms
class CalculateTextField extends StatelessWidget {
  final String label;
  final List<TextInputFormatter> inputFormatter;
  final Color labelColor;
  final bool isEnabled;
  final TextEditingController controller;

  const CalculateTextField(
      {Key key,
      @required this.label,
      this.inputFormatter,
      this.labelColor,
      this.isEnabled,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child: Text(
            label,
            style: TextStyle(color: labelColor),
          ),
        ),
        TextField(
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.all(8),
              border: OutlineInputBorder(),
            ),
            enabled: isEnabled,
            keyboardType: TextInputType.number,
            controller: controller,
            inputFormatters: inputFormatter),
      ],
    );
  }
}
