#!/usr/env/bin fish

function use_none -d 'Exit materials environment'
  conda deactivate
  for e in (FW_CONFIG_FILE DB_LOC MP_LAUNCH_ROOT MP_CODES_ROOT MP_SCREEN_NAME)
    set -e $e
  end
  echo 'See you next time.'
end