import 'package:flutter/material.dart';

extension FpjExtensionList on List {
  ListView genListView({
    ScrollPhysics? physics,
    ScrollController? controller,
    EdgeInsetsGeometry? padding,
    required Widget Function(
      Object data,
      int index,
    ) build,
  }) {
    return ListView(
      physics: physics ?? const BouncingScrollPhysics(),
      controller: controller,
      padding: padding,
      children: this.map<Widget>((ele) {
        return build(ele, this.indexOf(ele));
      }).toList(),
    );
  }

  ListView genBuildListView({
    required Widget Function(
      BuildContext context,
      Object data,
      int index,
    ) buildWidget,
    required Widget Function(
      BuildContext context,
      Object data,
      int index,
    ) buildDivider,
    ScrollPhysics? physics,
    ScrollController? controller,
    EdgeInsetsGeometry? padding,
    bool shrinkWrap = false,
  }) {
    return ListView.separated(
      physics: physics ?? const BouncingScrollPhysics(),
      padding: padding ?? EdgeInsets.zero,
      controller: controller,
      itemBuilder: (context, index) {
        return buildWidget(context, this[index], index);
      },
      separatorBuilder: (context, index) {
        return buildDivider(context, this[index], index);
      },
      itemCount: this.length ,
      shrinkWrap: shrinkWrap,
    );
  }

  GridView genGridView({
    required int crossAxisCount,
    double aspectRatio = 1,
    double mainAxisSpacing = 1,
    double crossAxisSpacing = 1,
    ScrollPhysics? physics,
    ScrollController? controller,
    EdgeInsetsGeometry? padding,
    required Widget Function(
      Object data,
      int index,
    ) build,
  }) {
    return GridView.count(
      crossAxisCount: crossAxisCount,
      mainAxisSpacing: mainAxisSpacing,
      crossAxisSpacing: crossAxisSpacing,
      controller: controller,
      childAspectRatio: aspectRatio,
      physics: physics ?? const BouncingScrollPhysics(),
      padding: padding,
      children: this.map<Widget>((ele) {
        return build(ele, this.indexOf(ele));
      }).toList(),
    );
  }

  Row row({
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    VerticalDirection verticalDirection = VerticalDirection.down,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    TextDirection? textDirection,
    TextBaseline? textBaseline,
  }) {
    return Row(
      crossAxisAlignment: crossAxisAlignment,
      verticalDirection: verticalDirection,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      textDirection: textDirection,
      textBaseline: textBaseline,
      children: this.map((t) {
        return t as Widget;
      }).toList(),
    );
  }

  Column column({
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    VerticalDirection verticalDirection = VerticalDirection.down,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    TextDirection? textDirection,
    TextBaseline? textBaseline,
  }) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      verticalDirection: verticalDirection,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      textDirection: textDirection,
      textBaseline: textBaseline,
      children: this.map((t) {
        return t as Widget;
      }).toList(),
    );
  }


  Stack stack(){
    return Stack(
      children: this.map((t) {
        return t as Widget;
      }).toList(),
    );
  }

}
