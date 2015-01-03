// Copyright (c) 2015, Benjamin NGUYEN. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library countdown.test;


import "dart:async";

import 'package:scheduled_test/scheduled_test.dart';

import 'package:countdown/countdown.dart';
import 'package:quiver/time.dart';

main() {

    int accuracy = 100;

    test("CountDown: start and wait still the end", () {
        schedule(() {

            currentSchedule.timeout = aSecond * 11;

            Completer completer = new Completer();
            DateTime begin = new DateTime.now();

            CountDown tc = new CountDown(aSecond * 5);
            var sub = tc.stream.listen(null);

            sub.onData((Duration d) {
                //print(d);
            });

            sub.onDone(() {

                int result = new DateTime.now().difference(begin).inMilliseconds;
                if (result > 5000 - accuracy && result < 5000 + accuracy) {
                    completer.complete();
                } else {
                    completer.completeError(result);
                }

            });

            return completer.future;
        });
    });


    test("CountDown: start and pause for 500ms", () {
        schedule(() {
            currentSchedule.timeout = aSecond * 11;

            Completer completer = new Completer();
            DateTime begin = new DateTime.now();

            CountDown tc = new CountDown(aSecond * 5);
            var sub = tc.stream.listen(null);

            sub.onData((Duration d) {
                //print(d);
            });

            sub.onDone(() {

                int result = new DateTime.now().difference(begin).inMilliseconds;
                if (result > 5500 - accuracy && result < 5500 + accuracy) {
                    completer.complete();
                } else {
                    completer.completeError(result);
                }

            });

            new Timer(new Duration(milliseconds: 2000), () {
                sub.pause();
            });

            new Timer(new Duration(milliseconds: 2500), () {
                sub.resume();
            });

            return completer.future;
        });
    });


    test("CountDown: start and multiple pause", () {
        schedule(() {
            currentSchedule.timeout = aSecond * 11;

            Completer completer = new Completer();
            DateTime begin = new DateTime.now();

            CountDown tc = new CountDown(aSecond * 5);
            var sub = tc.stream.listen(null);

            sub.onData((Duration d) {
                //print(d);
            });

            sub.onDone(() {

                int result = new DateTime.now().difference(begin).inMilliseconds;
                if (result > 6500 - accuracy && result < 6500 + accuracy) {
                    completer.complete();
                } else {
                    completer.completeError(result);
                }

            });

            new Timer(new Duration(milliseconds: 2000), () {
                sub.pause();
            });

            new Timer(new Duration(milliseconds: 2500), () {
                sub.resume();
            });

            new Timer(new Duration(milliseconds: 3000), () {
                sub.pause();
            });

            new Timer(new Duration(milliseconds: 3100), () {
                sub.resume();
            });

            new Timer(new Duration(milliseconds: 3300), () {
                sub.pause();
            });

            new Timer(new Duration(milliseconds: 3400), () {
                sub.resume();
            });

            new Timer(new Duration(milliseconds: 4000), () {
                sub.pause();
            });

            new Timer(new Duration(milliseconds: 4800), () {
                sub.resume();
            });

            return completer.future;
        });
    });

}
