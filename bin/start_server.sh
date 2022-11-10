#!/bin/bash

# エラーで処理中断
set -ex

if [ "${LOCAL_DOCKER_COMPOSE_MODE}" = "" ]; then
  ln -sf /dev/stdout /usr/src/app/log/${RAILS_ENV}.log
fi

if [ "${BATCH_MODE}" = "1" ]; then
  echo "rails migration cancel (BATCH_MODE: ${BATCH_MODE})"
else
  bin/rails db:create
  bin/rails ridgepole:apply
fi

if [ "${MANUAL}" = "1" ] ; then
  echo "[MANUAL MODE]"
  tail -f /dev/null
else
  ${BASH_SOURCE%/*}/start_rails
fi

