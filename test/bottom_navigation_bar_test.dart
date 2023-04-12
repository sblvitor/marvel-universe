import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Bottom navigation bar callback test', (tester) async {
    late int mutatedIndex;

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Characters"),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: "Search"),
            BottomNavigationBarItem(
                icon: Icon(Icons.menu_book),
                label: "Comics")
          ],
          onTap: (value) {
            // Respond to item press.
            mutatedIndex = value;
          },
        ),
      ),
    ));

    await tester.tap(find.text("Characters"));
    
    expect(mutatedIndex, 0);
  });
  
  testWidgets('Bottom navigation bar should have 3 contents', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Characters"),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: "Search"),
            BottomNavigationBarItem(
                icon: Icon(Icons.menu_book),
                label: "Comics")
          ],
        ),
      ),
    ));

    final RenderBox box = tester.renderObject(find.byType(BottomNavigationBar));
    expect(box.size.height, kBottomNavigationBarHeight);
    expect(find.text('Characters'), findsOneWidget);
    expect(find.text('Search'), findsOneWidget);
    expect(find.text('Comics'), findsOneWidget);
  });
}