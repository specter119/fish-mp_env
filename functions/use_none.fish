#!/usr/env/bin fish

function use_none -d 'Exit materials environment'
  conda deactivate
  set -e FW_CONFIG_FILE DB_LOC MP_LAUNCH_ROOT MP_CODES_ROOT MP_SCREEN_NAME
  echo 'See you next time.'
end