#!/usr/bin/env bash

fail() {
  echo 'unit tests failed'
  exit 1
}

noCoverage() {
  sh -c "echo 'coverage.cov file not found. Run first: \033[4;33mgo test --tags=!integration ./... -coverprofile=coverage.cov ./...\033[0;37m'"
  exit 1
}

noTreshold() {
  echo '.testcoverage.yml file not found. Create first that file following this sample https://github.com/vladopajic/go-test-coverage/blob/main/.testcoverage.example.yml'
  exit 1
}

# go test --tags=!integration ./... -coverprofile=coverage.cov ./... || fail
if [ ! -f coverage.cov ]
then
  noCoverage
fi

if [ ! -f .testcoverage.yml ]
then
  noTreshold
fi

go-test-coverage -config .testcoverage.yml || fail
rm ./coverage.cov || echo "coverage file removed"
