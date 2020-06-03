// Imports the Flutter Driver API.
import 'dart:async';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Layout App', () {
    // First, define the Finders and use them to locate widgets from the
    // test suite. Note: the Strings provided to the `byValueKey` method must
    // be the same as the Strings we used for the Keys in step 1.
    var counterTextFinder = find.byValueKey('small_layout');
   
    var  counterTextFinder2 = find.byValueKey('medium_layout');
    
    //final buttonFinder = find.byValueKey('increment');

    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('layout at start', () async {
      // Use the `driver.getText` method to verify the counter starts at 0.
      try {
        expect(await driver.getText(counterTextFinder), "Small Layout");
      } on TimeoutException catch(e) {
        expect(await driver.getText(counterTextFinder2), "Medium Layout");
      }
     
        
      
      
    });

    
  });
}