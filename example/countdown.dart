// Copyright (c) 2015, Benjamin NGUYEN. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library countdown.example;

import 'package:countdown/countdown.dart';
import 'dart:async';

main() {
  CountDown cd = CountDown(Duration(seconds: 10));
  var sub = cd.stream.listen(null);

  sub.onData((Duration d) {
    print(d);
  });

  sub.onDone(() {
    print("done");
  });

  Timer(Duration(milliseconds: 4000), () {
    sub.pause();
  });

  Timer(Duration(milliseconds: 4800), () {
    sub.resume();
  });
}
