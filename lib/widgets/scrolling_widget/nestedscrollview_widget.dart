import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String _title = 'NestedScrollview Widget Example';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: _title,
      home: Scaffold(
        body: MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyStatefulWidget();
  }
}

class _MyStatefulWidget extends State<MyStatefulWidget>
    with SingleTickerProviderStateMixin {
  var _tabs = <String>['Car', 'Transit', 'Bike'];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: _tabs.length,
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              child: SliverAppBar(
                title: const Text(
                  'Vehicles',
                ),
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    print('点击了返回按钮~');
                  },
                ),
                centerTitle: false,
                floating: false,
                snap: false,
                primary: true,
                //This is the title in the appbar.
                pinned: true,
                expandedHeight: 250.0,
                // The "forceElevated" property causes the SliverAppBar to show
                // a shadow. The "innerBoxIsScrolled" parameter is true when the
                // inner scroll view is scrolled beyond its "zero" point, i.e.
                // when it appears to be scrolled below the SliverAppBar.
                // Without this, there are cases where the shadow would appear
                // or not appear inappropriately, because the SliverAppBar is
                // not actually aware of the precise position of the inner
                // scroll views.
                forceElevated: innerBoxIsScrolled,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    'images/pavlova.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
                bottom: TabBar(
                  tabs: _tabs.map((String name) => Tab(text: name)).toList(),
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          children: _tabs.map(
            (String name) {
              return SafeArea(
                top: false,
                bottom: false,
                child: Builder(
                  builder: (BuildContext context) {
                    return CustomScrollView(
                      key: PageStorageKey<String>(name),
                      slivers: <Widget>[
                        SliverOverlapInjector(
                            handle:
                                NestedScrollView.sliverOverlapAbsorberHandleFor(
                                    context)),
                        SliverPadding(
                          padding: const EdgeInsets.all(8.0),
                          sliver: SliverFixedExtentList(
                              delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
                                  return ListTile(
                                    title: Text('Tiem $index'),
                                  );
                                },
                                childCount: 30,
                              ),
                              itemExtent: 48.0),
                        ),
                      ],
                    );
                  },
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
