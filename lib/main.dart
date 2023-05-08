import 'package:ccard/credit_card.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
              child: Column(
        children: [
          const CCards(),
          const SizedBox(height: 10,),
          ElevatedButton(
            onPressed: (){
              // navigate to credit card scrren
              Navigator.push(context, MaterialPageRoute(builder: ((context) => FlippableCard())));
            },
            style: TextButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.deepPurpleAccent,
            fixedSize: const Size(200, 30),
          ),
          child: const Text("Credite Crads Version 2.0", style: TextStyle(color: Colors.white),))
        ],
      ))),
    );
  }
}

class CCards extends StatelessWidget {
  const CCards({super.key});

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
    Widget buildCollapsed2() {
      return Stack(alignment: Alignment.topLeft, children: [
        Image.asset(
          "assets/images/1.png",
          scale: 3,
        ),
        Image.asset(
          "assets/images/2.png",
          scale: 7,
        ),
        Image.asset(
          "assets/images/3.png",
          scale: 9,
        ),
        Image.asset(
          "assets/images/4.png",
          scale: 12,
        ),
      ]);
    }

    // title and subtitle
    Widget buildExpanded1() {
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
    Widget buildExpanded2() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "assets/images/1.png",
            scale: 3,
          ),
          Image.asset(
            "assets/images/2.png",
            scale: 3,
          ),
          Image.asset(
            "assets/images/3.png",
            scale: 3,
          ),
          Image.asset(
            "assets/images/4.png",
            scale: 3,
          ),
        ],
      );
    }

    return ExpandableNotifier(
        child: Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
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
    ));
  }
}
