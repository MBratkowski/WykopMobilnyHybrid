import 'package:flutter/material.dart';
import 'dart:async';

/*
 * Works around flutter#20495
 */
class NotSuddenJumpPhysics extends ClampingScrollPhysics {
  @override
  double get dragStartDistanceMotionThreshold => 3.5;
}

typedef void LoadMoreDataCallback(Completer completer);

class NotSuddenJumpScrollBehavior extends ScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    switch (getPlatform(context)) {
      case TargetPlatform.iOS:
        return const BouncingScrollPhysics();
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        return NotSuddenJumpPhysics();
    }
    return null;
  }
}

typedef ItemBuilder = Widget Function(BuildContext, int);

class InfiniteList extends StatefulWidget {
  final int itemCount;
  final bool hasReachedEnd;
  final ItemBuilder itemBuilder;
  final LoadMoreDataCallback loadData;
  InfiniteList(
      {this.itemBuilder, this.hasReachedEnd, this.itemCount, this.loadData});

  @override
  _InfiniteListState createState() => _InfiniteListState();
}

class _InfiniteListState extends State<InfiniteList> {
  ScrollController _scrollController = ScrollController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (!isLoading &&
          !widget.hasReachedEnd &&
          _scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent) {
        var completer = Completer();
        setState(() {
          isLoading = true;
        });
        completer.future.then((e) {
          setState(() {
            isLoading = false;
          });
        });
        widget.loadData(completer);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
        behavior: NotSuddenJumpScrollBehavior(),
        child: CustomScrollView(
          semanticChildCount: 4,
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  if (index == widget.itemCount - 1) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: widget.hasReachedEnd
                            ? Column(children: [
                                Text('To jest już koniec :)'),
                                Image.asset(
                                  'rogal.png',
                                  width: 100,
                                  height: 100,
                                )
                              ])
                            : CircularProgressIndicator(),
                      ),
                    );
                  }

                  return widget.itemBuilder(context, index);
                },
                childCount: widget.itemCount,
              ),
            )
          ],
          controller: _scrollController,
        ));
    return ScrollConfiguration(
        behavior: NotSuddenJumpScrollBehavior(),
        child: ListView.builder(
          physics: NotSuddenJumpPhysics(),
          itemCount: widget.itemCount + 1,
          itemBuilder: (context, index) {
            if (index == widget.itemCount) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: widget.hasReachedEnd
                      ? Column(children: [
                          Text('To jest już koniec :)'),
                          Image.asset(
                            'rogal.png',
                            width: 100,
                            height: 100,
                          )
                        ])
                      : CircularProgressIndicator(),
                ),
              );
            }

            return widget.itemBuilder(context, index);
          },
          controller: _scrollController,
        ));
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }
}
