#!/usr/bin/env bash

fail() {
  echo "unit tests failed"
  exit 1
}

# go test --tags=!integration ./... -coverprofile=coverage.cov ./... || fail
go-test-coverage -config .testcoverage.yml || fail
