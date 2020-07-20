import 'package:flutter/material.dart';

class SimpleFutureBuilder<T> extends FutureBuilder<T> {
  SimpleFutureBuilder({
    @required BuildContext context,

    @required Future<T> future,
    @required Widget noneChild,
    @required Widget noDataChild,
    @required Widget activeChild,
    @required Widget waitingChild,
    @required Widget unknownChild,

    @required Function(String) errorBuilder,
    @required Function(AsyncSnapshot<T>) builder,
  }): super(
    future: future,

    builder: (context, AsyncSnapshot<T> snapshot) {
      if (snapshot.hasData) {

        switch(snapshot.connectionState) {
          case ConnectionState.none:
            return noneChild;
          case ConnectionState.waiting:
            if (waitingChild != null)
              return waitingChild;
            return builder(snapshot);
          case ConnectionState.active:
            if (activeChild != null)
              return activeChild;
            return SliverToBoxAdapter(child: Container());
          case ConnectionState.done:
            if (snapshot.hasData)
              return builder(snapshot);
            return noDataChild;
        }
      } else if (snapshot.hasError)
        return errorBuilder(snapshot.error.toString());

      if (waitingChild != null) return waitingChild;
      else return SliverToBoxAdapter(child: Container());
    }
  );

  SimpleFutureBuilder.simpler({
    @required Future<T> future,
    @required BuildContext context,
    @required Function(AsyncSnapshot<T>) builder
  }): this(
    context: context,
    future: future,
    noneChild: Text("No Connection was found"),
    noDataChild: Text("No Data was found"),
    unknownChild: Text("Unknown Error Occurred"),
    activeChild: Center(child: Column(children: <Widget>[
      CircularProgressIndicator(strokeWidth: 2),
      Text('Please Wait ...')
    ])),
    waitingChild: Center(child: Column(children: <Widget>[
      CircularProgressIndicator(strokeWidth: 2),
      Text('Please Wait ...')
    ])),

    errorBuilder: (String error) => Center(child: Container(child:  Text(error))),
    builder: builder,
  );

  SimpleFutureBuilder.simplerSliver({
    bool showLoading = true,
    @required Future<T> future,
    @required BuildContext context,
    @required Function(AsyncSnapshot<T>) builder
  }): this(
    future: future,
    context: context,
    noneChild: SliverToBoxAdapter(child: Text("No Connection was found")),
    noDataChild: SliverToBoxAdapter(child: Text("No Data was found")),
    unknownChild: SliverToBoxAdapter(child: Text("Unknown Error Occurred")),
    activeChild: showLoading ? SliverToBoxAdapter(child: Center(child: Column(children: <Widget>[
      CircularProgressIndicator(strokeWidth: 2),
      SizedBox(height: 10),
      Text('Please Wait ...')
    ]))): null,
    waitingChild: showLoading ? SliverToBoxAdapter(child: Center(child: Column(children: <Widget>[
      CircularProgressIndicator(strokeWidth: 2),
      SizedBox(height: 10),
      Text('Please Wait ...')
    ]))): null,

    errorBuilder: (String error) => SliverToBoxAdapter(child: Center(child: Container(child: Text("An error occurred!")))),
    builder: builder,
  );
}