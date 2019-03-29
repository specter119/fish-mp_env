#!/usr/env/bin fish

function plaunch -d 'Launch calculations background continuously'
  set -q MP_LAUNCH_ROOT[1]; or set MP_LAUNCH_ROOT $HOME/blocks
  cd $MP_LAUNCH_ROOT
  set -q $argv[1]; and set queue_len 4; or set queue_len $argv[1]
  if [ ( screen -ls | grep $MP_SCREEN_NAME | wc -l ) -eq 0 ]
    screen -dmS $MP_SCREEN_NAME qlaunch -r rapidfire --nlaunches infinite -m $queue_len --sleep 30 -b 10000
  end
  cd $dirprev[-1]
end