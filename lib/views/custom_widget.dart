import 'package:flutter/material.dart';

AppBar titleWidget({String title = "", TextStyle? textStyle, bool centerTitle = true, Color bgColor = Colors.transparent, Widget? leading}) {
  return AppBar(
    title: Text(
      title,
      style: textStyle ?? const TextStyle(fontSize: 18, color: Colors.black),
    ),
    centerTitle: centerTitle,
    backgroundColor: bgColor,
    leading: leading,
  );
}

Widget textWidget({String text = "", TextStyle? textStyle, Function? click}) {
  return (click != null)
      ? GestureDetector(
          onTap: () {
            click();
          },
          child: Text(
            text,
            style: textStyle,
          ),
        )
      : Text(
          text,
          style: textStyle,
        );
}

Widget h(double height, {Color bgColor = Colors.transparent}) {
  return Container(
    height: height,
    color: bgColor,
  );
}

Widget w(double width, {Color bgColor = Colors.transparent}) {
  return Container(
    width: width,
    color: bgColor,
  );
}

Widget wh({
  required double width,
  required double height,
  Color bgColor = Colors.transparent,
  BoxDecoration? decoration,
}) {
  return Container(
    width: width,
    height: height,
    decoration: decoration ?? BoxDecoration(color: bgColor),
  );
}

// 写一个圆形图案的widget
Widget roundView({
  Widget? label,
  Color? color,
  double width = 14.0,
  double height = 14.0,
}) {
  return Padding(
    padding: const EdgeInsets.only(top: 3, bottom: 3),
    child: Row(
      children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(shape: BoxShape.circle, color: color ?? Colors.transparent),
        ),
        w(10),
        label ?? Container(),
      ],
    ),
  );
}

// row 容器，从左到右4个组件分别是：红色图标，黑色text文本，输入框内容是黑色字体提示语是灰色加上是否允许编辑的条件 ，text按钮
Widget rowEditView({
  Key? key,
  BuildContext? context,
  Widget? left,
  required String label,
  String? content,
  Widget? child,
  bool editEnable = true,
  String hintText = "",
  Function(String)? onValueChange,
}) {
  TextEditingController textEditingController = TextEditingController();
  textEditingController.value = textEditingController.value.copyWith(text: content);
  return Column(
    children: [
      Row(
        children: [
          if (left != null)
            SizedBox(
              width: 20,
              child: left,
            ),
          context != null
              ? SizedBox(width: MediaQuery.of(context).size.width / 3, child: textWidget(text: label, textStyle: TextStyle(color: Colors.black, fontSize: 18)))
              : Expanded(flex: 2, child: textWidget(text: label, textStyle: TextStyle(color: Colors.black, fontSize: 18))),
          Expanded(
              key: key,
              flex: 5,
              child: child ??
                  TextField(
                    controller: textEditingController,
                    enabled: editEnable,
                    style: TextStyle(color: Colors.black, fontSize: 18),
                    decoration: InputDecoration(
                      hintText: hintText,
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                      border: InputBorder.none,
                    ),
                    maxLines: null,
                    onChanged: (value) {
                      onValueChange!(value);
                    },
                  )),
        ],
      ),
      Divider(
        height: 2,
        color: Colors.transparent,
      )
    ],
  );
}


Decoration roundDecoration({required List<Color> colors, double radius = 5}) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
    gradient: LinearGradient(colors: colors)
  );
}
