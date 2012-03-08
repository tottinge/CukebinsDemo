#!/bin/bash -ex
(
    cd features/step_definitions
    g++  cuke_fixture.cpp blackjack.cpp /usr/lib/libCukeBins.a /usr/lib/libgtest.a -lboost_thread -lboost_regex -lboost_system -lboost_date_time -o blackjack_steps
)
