## I need help to update this package because I'm not playing with dart anymore

## Countdown - yet another countdown !!

Countdown is countdown with pause/resume controls.

### Install [here](https://pub.dartlang.org/packages/countdown)

### Simple use

```
import 'package:countdown/countdown.dart';

main() {
    CountDown cd = new CountDown(new Duration(seconds : 10));
    var sub = cd.stream.listen(null);

    // start your countdown by registering a listener
    sub.onData((Duration d) {
        print(d);
    });

    // when it finish the onDone cb is called
    sub.onDone(() {
        print("done");
    });
}
```

### Use with controls
```
import 'package:countdown/countdown.dart';
import 'dart:async';

main() {

    CountDown cd = new CountDown(new Duration(seconds : 10));
    var sub = cd.stream.listen(null);

    sub.onData((Duration d) {
        print(d);
    });

    sub.onDone(() {
        print("done");
    });

    /// the countdown will have 500ms delay 
    new Timer(new Duration(milliseconds: 4000), () {
        sub.pause();
    });
    new Timer(new Duration(milliseconds: 4500), () {
        sub.resume();
    });

}
```
### Tests
```
dart test/all_test.dart
```
