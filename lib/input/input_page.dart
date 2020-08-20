import 'package:flutter/material.dart';

class InputPage extends StatelessWidget {

  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    // 文本改变监听：第二种方式
    _nameController.addListener(() {

    });

    Column(
      children: <Widget>[
        TextField(
          controller: _nameController,
          autofocus: true,
          maxLength: 10,
          maxLines: 1,
          maxLengthEnforced: false,// 决定当输入文本长度超过maxLength时是否阻止输入
          decoration: InputDecoration(
              labelText: "用户名",
              hintText: "用户名或邮箱",
              prefixIcon: Icon(Icons.person)),
          onChanged: (content) {
            print("用户名：${_nameController.text}");
          },
        ),
        TextField(
          decoration: InputDecoration(
              labelText: "密码",
              hintText: "您的登录密码",
              prefixIcon: Icon(Icons.lock)),
          obscureText: true,
        ),
      ],
    );

    return Container(
      child: TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              labelText: "Email",
              hintText: "电子邮件地址",
              prefixIcon: Icon(Icons.email),
              border: InputBorder.none //隐藏下划线
          )
      ),
      decoration: BoxDecoration(
        // 下滑线浅灰色，宽度1像素
          border: Border(bottom: BorderSide(color: Colors.grey[600], width: 1.0))
      ),
    );
  }
}
