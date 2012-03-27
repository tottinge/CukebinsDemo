#!/bin/bash -ex
(
    cd features/step_definitions
    g++  cuke_fixture.cpp $CUKEBINS_ROOT/build/src/libCukeBins.a $GTEST_ROOT/lib/libgtest.a \
      -I $GTEST_ROOT/include \
      -I $CUKEBINS_ROOT/include \
      -lboost_thread-mt -lboost_regex-mt -lboost_system-mt -lboost_date_time-mt \
      -o blackjack_steps
)
