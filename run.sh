#!/bin/bash -ex
features/step_definitions/blackjack_steps & cucumber -o run.out 
cat run.out
