#!/usr/env/bin fish

function slaunch -d 'Launch one or more calculations'
  set -q MP_LAUNCH_ROOT[1]; or set -l MP_LAUNCH_ROOT $HOME/blocks
  cd $MP_LAUNCH_ROOT
  set -q $argv[1]; set -l n_launcher $argv[1] or set -l n_launcher 4
  qlaunch -r rapidfire --nlaunches $n_launcher -b 10000
  cd $OLDPWD
end
