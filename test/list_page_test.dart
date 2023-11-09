import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:luis_ramirez_theksquaregroup/pages/list_page.dart';

void main() {
  testWidgets('Should render error', (WidgetTester tester) async {
    var dataError =
        const AsyncSnapshot.withError(ConnectionState.done, "error");

    await tester.pumpWidget(TestApp(ListPage(data: dataError)));

    await tester.pump();
    expect(find.text('Error, try later'), findsOneWidget);
  });
  testWidgets('Should render loading', (WidgetTester tester) async {
    var data = const AsyncSnapshot.waiting();

    await tester.pumpWidget(TestApp(ListPage(data: data)));
    expect(find.text('Loading...'), findsOneWidget);
  });

  testWidgets('Should render correct', (WidgetTester tester) async {
    var data = const AsyncSnapshot.withData(ConnectionState.done, [
      {
        "id": 1,
        "name": "Leanne Graham",
        "username": "Bret",
        "email": "Sincere@april.biz",
        "address": {
          "street": "Kulas Light",
          "suite": "Apt. 556",
          "city": "Gwenborough",
          "zipcode": "92998-3874",
          "geo": {"lat": "-37.3159", "lng": "81.1496"}
        },
        "phone": "1-770-736-8031 x56442",
        "website": "hildegard.org",
        "company": {
          "name": "Romaguera-Crona",
          "catchPhrase": "Multi-layered client-server neural-net",
          "bs": "harness real-time e-markets"
        }
      }
    ]);

    await tester.pumpWidget(TestApp(ListPage(data: data)));

    await tester.pump();

    expect(find.text('Displaying data'), findsOneWidget);
  });
}

class TestApp extends StatelessWidget {
  final Widget child;

  const TestApp(this.child, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: child,
    );
  }
}
