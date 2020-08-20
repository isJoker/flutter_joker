import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FormPageState();
  }
}

class _FormPageState extends State<FormPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  GlobalKey _fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Text"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Form(
          key: _fromKey, // 设置globalKey，用于后面获取FormState
          autovalidate: true, // 是否自动校验输入内容
          child: Column(
            children: [
              _buildNameFormField(),
              _buildPwdFormField(),
              _buildLoginButton2()
            ],
          ),
        ),
      ),
    );
  }

  TextFormField _buildPwdFormField() {
    return TextFormField(
      controller: _pwdController,
      decoration: InputDecoration(
          labelText: '密码', hintText: '请输入密码', icon: Icon(Icons.lock)),
      obscureText: true,
      validator: (v) {
        return v.trim().length > 7 ? null : '密码不能少于8位';
      },
    );
  }

  TextFormField _buildNameFormField() {
    return TextFormField(
      autofocus: true,
      controller: _nameController,
      decoration: InputDecoration(
          labelText: '用户名', hintText: '请输入用户名或邮箱', icon: Icon(Icons.person)),
      validator: (v) {
        return v.trim().length > 0 ? null : '用户名不能为空';
      },
    );
  }

  Padding _buildLoginButton() {
    return Padding(
      padding: EdgeInsets.only(top: 28.0),
      child: Row(
        children: [
          Expanded(
            child: RaisedButton(
              padding: EdgeInsets.all(10.0),
              child: Text('登录'),
              color: Colors.green,
              textColor: Colors.white,
              onPressed: () {
                // 在这里不能通过此方式获取FormState，context是FormPage的context
                // 而Form.of(context)是根据所指定context向根去查找
                // FormState是在FormTestRoute的子树中，所以找不到
                // 正确使用方式请看方法[_buildLoginButton2]
//                print(Form.of(context));

                // 通过_formKey.currentState 获取FormState后，
                // 调用validate()方法校验用户名密码是否合法，校验
                // 通过后再提交数据。
                if ((_fromKey.currentState as FormState).validate()) {
                  //验证通过提交数据
                  print('登录验证通过');
                }
              },
            ),
          )
        ],
      ),
    );
  }

  Padding _buildLoginButton2() {
    return Padding(
      padding: EdgeInsets.only(top: 28.0),
      child: Row(
        children: [
          // 通过Builder来获取RaisedButton所在widget树的真正context(Element)
          Expanded(child: Builder(builder: (context) {
            return RaisedButton(
              padding: EdgeInsets.all(10.0),
              child: Text('登录'),
              color: Colors.green,
              textColor: Colors.white,
              onPressed: () {
                // 由于本widget也是Form的子代widget，所以可以通过下面方式获取FormState
                if (Form.of(context).validate()) {
                  //验证通过提交数据
                  print('登录验证通过');
                }
              },
            );
          }))
        ],
      ),
    );
  }
}
