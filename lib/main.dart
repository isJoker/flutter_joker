import 'package:flutter/material.dart';

import 'check/check_demo.dart';
import 'clip/clip_demo.dart';
import 'container/container_demo.dart';
import 'dialog/dialog_demo.dart';
import 'event/custom_notification_demo.dart';
import 'event/notification_demo.dart';
import 'event/pointer_event_demo.dart';
import 'func/will_pop_scope_demo.dart';
import 'future/future_demo.dart';
import 'future/stream_builder_demo.dart';
import 'gesture/gesture_dome.dart';
import 'list/custom_scroll_view.dart';
import 'list/grid_builder_demo.dart';
import 'list/grid_demo_page.dart';
import 'icon/icon_demo.dart';
import 'image/image_demo.dart';
import 'indicator/indicator_demo.dart';
import 'indicator/progress_demo.dart';
import 'input/form_page.dart';
import 'input/input_page.dart';
import 'layout/align_demo.dart';
import 'layout/center_demo.dart';
import 'layout/expanded_demo.dart';
import 'layout/follow_demo.dart';
import 'layout/row_demo.dart';
import 'layout/stack_dome.dart';
import 'layout/wrap_demo.dart';
import 'list/scroll_listener.dart';
import 'list/scroll_notification.dart';
import 'list/staggered_grid_view.dart';
import 'scaffold/scaffold_demo.dart';
import 'state/inherited_widget_demo.dart';
import 'state/test_provider_impl_demo.dart';
import 'text/text_domo.dart';
import 'theme/theme_demo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test',
      theme: ThemeData(
          primaryColor: Colors.green[800]
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('测试'),
        ),
        body: Center(
          child: NotificationRoute(),
        ),
      ),
//      home: ThemeTestRoute(),
    );
  }
}
