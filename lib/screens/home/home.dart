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

// final blackPerfectTextController = new TextEditingController();
// final tpTextController = new TextEditingController();
// final perfectTextController = new TextEditingController();
// final goodTextController = new TextEditingController();
// final badTextController = new TextEditingController();
// final missTextController = new TextEditingController();

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

                                    // tpTextController.text =
                                    //     result.state.tp.toString();
                                    // perfectTextController.text =
                                    //     result.state.perfect.toString();
                                    // goodTextController.text =
                                    //     result.state.good.toString();
                                    // badTextController.text =
                                    //     result.state.bad.toString();
                                    // missTextController.text =
                                    //     result.state.miss.toString();
                                    // blackPerfectTextController.text =
                                    //     result.state.blackPerfect.toString();

                                    Scaffold.of(context).showSnackBar(SnackBar(
                                      // 画像の読み込みに成功した時のメッセージ
                                      //TODO localize
                                      content: Text("画像の読み込みに成功しました。"),
                                      backgroundColor: Palette.success,
                                      duration: Duration(seconds: 5),
                                    ));
                                  }).catchError((e) {
                                    print(e);
                                    print("リザルトではない画像が選ばれました");

                                    Scaffold.of(context).showSnackBar(SnackBar(
                                      // 画像の読み込みにした時のメッセージ
                                      //TODO localize
                                      content: Text("正しく画像が読み込めませんでした。"),
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

// Organisms
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

    // final setTextField = () {
    //   print("テキストフィールドセット");
    //
    //   resultState = resultState.copyWith(
    //     tp: double.parse(
    //         tpTextController.text == "" ? "0" : tpTextController.text),
    //     perfect: int.parse(perfectTextController.text == ""
    //         ? "0"
    //         : perfectTextController.text),
    //     good: int.parse(
    //         goodTextController.text == "" ? "0" : perfectTextController.text),
    //     bad: int.parse(
    //         badTextController.text == "" ? "0" : perfectTextController.text),
    //     miss: int.parse(
    //         missTextController.text == "" ? "0" : perfectTextController.text),
    //   );
    // };
    //
    // final onClear = () {
    //   tpTextController.text = "";
    //   perfectTextController.text = "";
    //   goodTextController.text = "";
    //   badTextController.text = "";
    //   missTextController.text = "";
    //   blackPerfectTextController.text = "";
    // };

    final _formKey = GlobalKey<FormState>();

    return Form(
      key: _formKey,
      child: ListView(
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
                    // controller: tpTextController,
                    onSaved: (value) {
                      result.setTp(double.parse(value));
                    },
                    initialValue: useProvider(resultNotifierProvider.state).tp?.toString() ?? "",
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
                    // controller: perfectTextController,
                    onSaved: (value) {
                      result.setPerfect(int.parse(value));
                    },
                    initialValue: useProvider(resultNotifierProvider.state).perfect?.toString() ?? "",
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
                    // controller: goodTextController,
                    onSaved: (value) {
                      result.setGood(int.parse(value));
                    },
                    initialValue: useProvider(resultNotifierProvider.state).good?.toString() ?? "",
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
                    // controller: badTextController,
                    onSaved: (value) {
                      result.setBad(int.parse(value));
                    },
                    initialValue: useProvider(resultNotifierProvider.state).bad?.toString() ?? "",
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
                    // controller: missTextController,
                    onSaved: (value) {
                      result.setMiss(int.parse(value));
                    },
                    initialValue: useProvider(resultNotifierProvider.state).miss?.toString() ?? "",
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
                      // setTextField();
                      _formKey.currentState.save();

                      result.calculate();

                      print(result.state);

                      // blackPerfectTextController.text =
                      //     resultState.blackPerfect.toString();

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
                      // _formKey.currentState.reset();
                      result.reset();
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
                    // controller: blackPerfectTextController,
                    isEnabled: false,
                    initialValue: useProvider(resultNotifierProvider.state).blackPerfect?.toString() ?? "",
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
      ),
    );
  }
}

// Molecules
class CalculateTextField extends StatelessWidget {
  final String label;
  final List<TextInputFormatter> inputFormatter;
  final Color labelColor;
  final bool isEnabled;
  final TextEditingController controller;
  final Function(String) onSaved;
  final String initialValue;

  const CalculateTextField(
      {Key key,
      @required this.label,
      this.inputFormatter,
      this.labelColor,
      this.isEnabled,
      this.controller,
      this.onSaved, this.initialValue})
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
        TextFormField(
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.all(8),
            border: OutlineInputBorder(),
          ),
          enabled: isEnabled,
          keyboardType: TextInputType.number,
          controller: controller,
          inputFormatters: inputFormatter,
          onSaved: onSaved,
          initialValue: initialValue,
        ),
      ],
    );
  }
}
