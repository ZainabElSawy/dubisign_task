import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dubisign/features/cart/presentation/widgets/custom_cart_item_quantity_row.dart';
import 'package:dubisign/core/utils/style.dart'; // Import Styles

void main() {
  setUpAll(() {
    Styles.textStyle12 = const TextStyle(fontSize: 12, color: Colors.black);
  });

  testWidgets('should increase and decrease quantity on tap',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (_, child) => MaterialApp(
          home: Scaffold(
            body: CustomCartItemQuantityRow(quantity: 2),
          ),
        ),
      ),
    );
    expect(find.text('2'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('3'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.remove));
    await tester.pump();

    expect(find.text('2'), findsOneWidget);
  });

  testWidgets('should not decrease below 1', (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (_, child) => MaterialApp(
          home: Scaffold(
            body: CustomCartItemQuantityRow(quantity: 1),
          ),
        ),
      ),
    );

    expect(find.text('1'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.remove));
    await tester.pump(); // Rebuild the widget

    expect(find.text('1'), findsOneWidget);
  });
}
