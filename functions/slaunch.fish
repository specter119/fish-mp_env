#!/usr/env/bin fish

function slaunch -d 'Launch one or more calculations'
  set -q MP_LAUNCH_ROOT[1]; or set MP_LAUNCH_ROOT $HOME/blocks
  cd $MP_LAUNCH_ROOT
  set -q $argv[1]; and set n_launcher $argv[1]; or set n_launcher 1
  echo "$n_launcher"
  qlaunch -r rapidfire --nlaunches $n_launcher -b 10000
  cd $OLDPWD
end
