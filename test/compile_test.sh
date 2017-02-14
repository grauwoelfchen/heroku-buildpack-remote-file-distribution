#!/usr/bin/env sh
# compile <build-dir> <cache-dir> <env-dir>

. ${BUILDPACK_TEST_RUNNER_HOME}/lib/test_utils.sh

test_cache_detection() {
  echo "region" > ${ENV_DIR}/RFD_S3_REGION
  echo "id"     > ${ENV_DIR}/RFD_S3_ACCESS_KEY_ID
  echo "secret" > ${ENV_DIR}/RFD_S3_ACCESS_KEY_SECRET

  echo "s3://foo/bar.txt static/baz.txt" > $BUILD_DIR/.remote-files
  mkdir -p ${BUILD_DIR}/.heroku/remote-file-distribution

  # cache
  mkdir -p $CACHE_DIR/.heroku/remote-file-distribution/foo
  touch $CACHE_DIR/.heroku/remote-file-distribution/foo/bar.txt
  cp $BUILD_DIR/.remote-files $CACHE_DIR/.heroku/.remote-files

  cd $BUILD_DIR
  mkdir static

  compile

  assertEquals "" "$(cat ${BUILD_DIR}/static/baz.txt)"
  assertCapturedSuccess
  assertCaptured "Remote file is found in cache as foo/bar.txt"
}
