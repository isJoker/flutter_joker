import 'package:flutter/material.dart';

class GradientButtonRoute extends StatefulWidget {
  @override
  _GradientButtonRouteState createState() => _GradientButtonRouteState();
}

class _GradientButtonRouteState extends State<GradientButtonRoute> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(20),
            child: GradientButton(
              height: 50.0,
              colors: [Colors.orange, Colors.red[700]],
              child: Text("Submit"),
              onPressed: onTap,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: GradientButton(
              height: 50.0,
              colors: [Colors.lightGreen, Colors.green[700]],
              child: Text("Submit"),
              onPressed: onTap,
              borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(20), right: Radius.circular(10)),
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: GradientButton(
              height: 50.0,
              colors: [Colors.lightBlue[300], Colors.blueAccent],
              child: Text("Submit"),
              onPressed: onTap,
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20), bottom: Radius.circular(10)),
            ),
          ),
        ],
      ),
    );
  }

  onTap() {
    print("button click");
  }
}

class GradientButton extends StatelessWidget {
  GradientButton({
    this.colors,
    this.width,
    this.height,
    this.onPressed,
    this.borderRadius,
    @required this.child,
  });

  // 渐变色数组
  final List<Color> colors;

  // 按钮宽高
  final double width;
  final double height;

  final Widget child;
  final BorderRadius borderRadius;

  //点击回调
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    //确保colors数组不空
    List<Color> _colors = colors ??
        [theme.primaryColor, theme.primaryColorDark ?? theme.primaryColor];

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: _colors),
        borderRadius: borderRadius,
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          splashColor: _colors.last,
          highlightColor: Colors.transparent,
          borderRadius: borderRadius,
          onTap: onPressed,
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(height: height, width: width),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DefaultTextStyle(
                  style: TextStyle(fontWeight: FontWeight.bold),
                  child: child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
