#!/bin/sh
# Tests the checks against non correct models to determine the validity of
# the tests themselves.

# Comment out SHOW_TEST to only show true or false (so leave out the test names)
#SHOW_TEST="TRUE"

function showTest {
    tmp="$1"
    if [ "$SHOW_TEST" = "TRUE" ]; then
        outp="${tmp//Running test: Verified_model\/Verification_files\//Test: }"
        echo "${outp//".pbes"/}"
    else
        echo "$tmp" | egrep '^(false|true)$'
    fi
}

DEAD_MODEL="Railway_crossing_dead"
UNSAFE_MODEL="Railway_crossing_unsafe"
NOHIDE_MODEL="Railway_crossing_nohide"
EGREP_STR="(Running test:)|(^(false|true)$)"

echo "Running the regular tests"
output=$(make tests | egrep "$EGREP_STR")
showTest "$output"
echo

echo "Running the dead tests"
output=$(make MODEL_NAME=$DEAD_MODEL tests | egrep "$EGREP_STR")
showTest "$output"
echo

echo "Running the unsafe tests"
output=$(make MODEL_NAME=$UNSAFE_MODEL tests | egrep "$EGREP_STR")
showTest "$output"
echo

echo "Running the no-hide tests"
output=$(make MODEL_NAME=$NOHIDE_MODEL tests | egrep "$EGREP_STR")
showTest "$output"
echo
