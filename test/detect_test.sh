#!/usr/bin/env sh
# detect <build-dir>

. $BUILDPACK_TEST_RUNNER_HOME/lib/test_utils.sh

testExitStatus() {
  touch $BUILD_DIR/.remote-files
  detect
  assertCapturedSuccess
}

testDetectedName() {
  touch $BUILD_DIR/.remote-files
  detect
  assertAppDetected "Remote File Distribution (.remote-files)"
}
