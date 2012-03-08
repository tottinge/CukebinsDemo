#!/bin/bash -ex
features/step_definitions/blackjack_steps & cucumber -o run.out --no-color
cat run.out
