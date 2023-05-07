import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: SingleChildScrollView(child: cCards())),
    );
  }
}

class cCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // title
    Widget buildCollapsed1() {
      return Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Credit Cards",
            ),
          ],
        ),
      );
    }

    // collapsed credit cards
    buildCollapsed2() {
      double size = 380;
      return Stack(alignment: Alignment.centerLeft, children: [
        Image.asset(width: size, height: size, "assets/images/1.png"),
        Image.asset(
            width: size / 1.2, height: size / 1.2, "assets/images/2.png"),
        Image.asset(
            width: size / 1.5, height: size / 1.5, "assets/images/3.png"),
        Image.asset(width: size / 2, height: size / 2, "assets/images/4.png"),
      ]);
    }
    // title and subtitle
    buildExpanded1() {
      return Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Credit Cards",
            ),
            Text(
              "You have 4 credit cards",
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
      );
    }
    // expanded credit cards
    buildExpanded2() {
      double size = 380;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(width: size, height: size, "assets/images/1.png"),
          Image.asset(width: size, height: size, "assets/images/2.png"),
          Image.asset(width: size, height: size, "assets/images/3.png"),
          Image.asset(width: size, height: size, "assets/images/4.png"),
        ],
      );
    }

    return ExpandableNotifier(
        child: Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
      child: ScrollOnExpand(
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expandable(
                collapsed: buildCollapsed1(),
                expanded: buildExpanded1(),
              ),
              Expandable(
                collapsed: buildCollapsed2(),
                expanded: buildExpanded2(),
              ),
              const Divider(
                height: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Builder(
                    builder: (context) {
                      var controller =
                          ExpandableController.of(context, required: true)!;
                      return TextButton(
                        child: Text(
                          controller.expanded ? "COLLAPSE" : "EXPAND",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(color: Colors.deepPurple),
                        ),
                        onPressed: () {
                          controller.toggle();
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
