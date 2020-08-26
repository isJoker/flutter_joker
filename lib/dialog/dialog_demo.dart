import 'package:flutter/material.dart';
import 'package:flutter_joker/util/Toast.dart';

import 'dialog_checkbox.dart';

class DialogTestRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DialogState();
  }
}

class DialogState extends State<DialogTestRoute> {
  bool _withTree = false; // 复选框选中状态

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RaisedButton(
          child: Text("AlertDialog"),
          onPressed: () async {
            //弹出对话框并等待其关闭
            bool delete = await _showAlertDialog(context);
            if (delete == null) {
              Toast.toast(context, "取消删除");
            } else {
              Toast.toast(context, "已确认删除");
              //... 删除文件
            }
          },
        ),
        RaisedButton(
          child: Text("SimpleDialog"),
          onPressed: () async {
            //弹出对话框并等待其关闭
            _changeLanguage(context);
          },
        ),
        RaisedButton(
          child: Text("Dialog"),
          onPressed: () async {
            //弹出对话框并等待其关闭
            _showListDialog(context);
          },
        ),
        RaisedButton(
          child: Text("CustomDialog"),
          onPressed: () async {
            //弹出对话框并等待其关闭
            bool delete = await _showCustomAlertDialog(context);
            if (delete == null) {
              Toast.toast(context, "取消删除");
            } else {
              Toast.toast(context, "已确认删除");
              //... 删除文件
            }
          },
        ),
        RaisedButton(
          child: Text("ManageDialogState"),
          onPressed: () async {
            //弹出对话框并等待其关闭
            bool delete = await _showDeleteConfirmDialog2(context);
            if (delete == null) {
              Toast.toast(context, "取消删除");
            } else {
              Toast.toast(context, "同时删除子目录: $delete");
              //... 删除文件
            }
          },
        ),
        RaisedButton(
          child: Text("显示底部菜单列表"),
          onPressed: () async {
            int type = await _showModalBottomSheet(context);
            Toast.toast(context, type.toString());
          },
        ),
        RaisedButton(
          child: Text("日历"),
          onPressed: () {
            _showDatePicker();
          },
        ),
      ],
    );
  }

  Future<bool> _showAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('提示'),
            content: Text('确认删除文件吗？'),
            actions: [
              FlatButton(
                child: Text('取消'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text('删除'),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          );
        });
  }

  Future<void> _changeLanguage(BuildContext context) async {
    int i = await showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('请选择语言'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  // 返回1
                  Navigator.pop(context, 1);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('中文简体'),
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  // 返回2
                  Navigator.pop(context, 2);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('美国英语'),
                ),
              ),
            ],
          );
        });

    if (i != null) {
      Toast.toast(context, "选择了：${i == 1 ? "中文简体" : "美国英语"}");
    }
  }

  Future<void> _showListDialog(BuildContext context) async {
    int index = await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
            child: Column(
          children: <Widget>[
            ListTile(title: Text("请选择")),
            Expanded(
                child: ListView.builder(
              itemCount: 30,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text("$index"),
                  onTap: () => Navigator.of(context).pop(index),
                );
              },
            )),
          ],
        ));
      },
    );
    if (index != null) {
      Toast.toast(context, "点击了：$index");
    }
  }

  Future<bool> _showCustomAlertDialog(BuildContext context) {
    return showCustomDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('提示'),
            content: Text('确认删除文件吗？'),
            actions: [
              FlatButton(
                child: Text('取消'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text('删除'),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          );
        });
  }

  Future<bool> showDeleteConfirmDialog(BuildContext context) {
    bool _withTree = false; //记录复选框是否选中
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("您确定要删除当前文件吗?"),
              Row(
                children: <Widget>[
                  Text("同时删除子目录？"),
                  DialogCheckbox(
                    value: _withTree, //默认不选中
                    onChanged: (bool value) {
                      //更新选中状态
                      _withTree = !_withTree;
                    },
                  ),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text("删除"),
              onPressed: () {
                // 将选中状态返回
                Navigator.of(context).pop(_withTree);
              },
            ),
          ],
        );
      },
    );
  }

  ///
  /// 使用 (context as Element).markNeedsBuild();
  ///
  /// 获取到对话框内部UI的Element对象，然后将其标示为为“dirty”，
  /// 在每一个Frame，Flutter都会重新构建被标记为“dirty”Element对象。
  ///
  Future<bool> _showDeleteConfirmDialog2(BuildContext context) {
    _withTree = false; // 默认复选框不选中
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("您确定要删除当前文件吗?"),
              Row(
                children: <Widget>[
                  Text("同时删除子目录？"),
                  Builder(
                    builder: (context) {
                      return Checkbox(
                        value: _withTree,
                        onChanged: (bool value) {
                          _withTree = !_withTree;
                          (context as Element).markNeedsBuild();
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text("删除"),
              onPressed: () {
                //执行删除操作
                Navigator.of(context).pop(_withTree);
              },
            ),
          ],
        );
      },
    );
  }

  ///
  /// 弹出底部菜单列表模态对话框
  ///
  /// showModalBottomSheet
  ///
  Future<int> _showModalBottomSheet(BuildContext context) {
    return showModalBottomSheet<int>(
      context: context,
      builder: (BuildContext context) {
        return ListView.builder(
          itemCount: 30,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text("$index"),
              onTap: () => Navigator.of(context).pop(index),
            );
          },
        );
      },
    );
  }

  Future<DateTime> _showDatePicker() {
    var date = DateTime.now();
    return showDatePicker(
      context: context,
      initialDate: date,
      firstDate: date,
      lastDate: date.add( //未来30天可选
        Duration(days: 30),
      ),
    );
  }

  Future<T> showCustomDialog<T>({
    @required BuildContext context,
    bool barrierDismissible = true,
    WidgetBuilder builder,
  }) {
    final ThemeData theme = Theme.of(context, shadowThemeOnly: true);
    return showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        final Widget pageChild = Builder(builder: builder);
        return SafeArea(
          child: Builder(builder: (BuildContext context) {
            return theme != null
                ? Theme(data: theme, child: pageChild)
                : pageChild;
          }),
        );
      },
      barrierDismissible: barrierDismissible,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Color(0x7355FF00),
      // 自定义遮罩颜色
      transitionDuration: const Duration(milliseconds: 150),
      transitionBuilder: _buildMaterialDialogTransitions,
    );
  }

  Widget _buildMaterialDialogTransitions(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    // 使用缩放动画
    return ScaleTransition(
      scale: CurvedAnimation(
        parent: animation,
        curve: Curves.easeOut,
      ),
      child: child,
    );
  }
}
