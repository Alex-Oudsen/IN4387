#!/bin/sh
# Tests the checks against a model without communication
# Some tests SHOULD fail
COMMFREE="Railway_crossing_commfree"
make MODEL_NAME=$COMMFREE tests | egrep '^(false|true)$'
