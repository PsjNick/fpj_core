import 'package:flutter/material.dart';
import 'package:fpj_core/extensions/fpj_extensions.dart';
import 'package:lifecycle/lifecycle.dart';

class FpjWidgetPage extends StatefulWidget {
  final Widget page;
  final Function? onPush;
  final Function? onVisible;
  final Function? onActive;
  final Function? onInactive;
  final Function? onInvisible;
  final Function? onPop;
  final bool? autoClearFocus , resizeToAvoidBottomInset;
  final Brightness statusBarBrightness;
  final TextStyle? defaultTextStyle;
  final String? title;
  final Color? bgColor;
  final Color? titleColor;
  final Color? iconColor;
  final List<Widget> ? actionChilds;

  const FpjWidgetPage({
    super.key,
    required this.page,
    this.onPush,
    this.onVisible,
    this.defaultTextStyle,
    this.onActive,
    this.onInactive,
    this.statusBarBrightness = Brightness.light,
    this.bgColor,
    this.title,
    this.titleColor,
    this.onInvisible,
    this.iconColor,
    this.resizeToAvoidBottomInset,
    this.actionChilds,
    this.onPop,
    this.autoClearFocus = true,
  });

  @override
  State<FpjWidgetPage> createState() => _FpjWidgetPageState();
}

class _FpjWidgetPageState extends State<FpjWidgetPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(widget.autoClearFocus);
        if (widget.autoClearFocus == true) {
          FocusScope.of(context).requestFocus(FocusNode());
        }
      },
      child: Material(
        color: Colors.transparent,
        child: DefaultTextStyle(
          style: widget.defaultTextStyle ?? TextStyle(),
          child: Builder(builder: (context) {
            return LifecycleWrapper(
              onLifecycleEvent: (LifecycleEvent event) {
                switch (event) {
                  case LifecycleEvent.push:
                    if (widget.onPush != null) {
                      widget.onPush!();
                    }
                    break;

                  case LifecycleEvent.visible:
                    if (widget.onVisible != null) {
                      widget.onVisible!();
                    }
                    break;

                  case LifecycleEvent.active:
                    if (widget.onActive != null) {
                      widget.onActive!();
                    }
                    break;
                  case LifecycleEvent.inactive:
                    if (widget.onInactive != null) {
                      widget.onInactive!();
                    }
                    break;
                  case LifecycleEvent.invisible:
                    if (widget.onInvisible != null) {
                      widget.onInvisible!();
                    }
                    break;

                  case LifecycleEvent.pop:
                    if (widget.onPop != null) {
                      widget.onPop!();
                    }
                    break;
                }
              },
              child: Builder(builder: (context) {
                if (widget.title != null || widget.bgColor != null) {
                  return Scaffold(
                    resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset ?? false,
                    backgroundColor: widget.bgColor ,
                    appBar:  widget.title == null ? null : AppBar(
                      iconTheme: IconThemeData(
                        color: widget.iconColor,
                      ),
                      centerTitle: true,
                      titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle?.copyWith(
                        color: widget.titleColor,
                      ),
                      actions: widget.actionChilds,
                      title: widget.title?.toTextWidget(),
                    ),
                    body: widget.page,
                  );
                }

                return widget.page;

              }),
            );
          }),
        ),
      ),
    );
  }
}
