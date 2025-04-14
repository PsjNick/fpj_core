import 'package:flutter/material.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

extension FpjExtensionWidgetBoxScrollView on BoxScrollView {
  SmartRefresher wrapRefresher({
    required RefreshController controller,
  ScrollController? scrollController,
    Function(RefreshController controller)? refresh,
    Function(RefreshController controller)? loadmore,
  }) {

    RefreshController _controller = controller ;

    return SmartRefresher(
      controller: _controller,
      scrollController:scrollController ,
      enablePullDown: refresh != null,
      onRefresh: refresh == null
          ? null
          : () async {
              try {
                _controller.loadComplete();
                await refresh(_controller);
              } finally {
                _controller.refreshCompleted(resetFooterState: true);
              }
            },
      enablePullUp: loadmore != null,
      onLoading: loadmore == null
          ? null
          : () async {
              try {
                _controller.refreshCompleted();
                await loadmore(_controller,);
              } finally {
                _controller.loadComplete();
              }
            },
      child: this,
    );
  }
}
