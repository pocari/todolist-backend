#!/bin/bash

set -ex

${BASH_SOURCE%/*}/wait_for_mysql.sh

bundle install --system

${BASH_SOURCE%/*}/start_server.sh

