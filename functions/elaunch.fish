#!/usr/env/bin fish

function elaunch -d 'End the background launching'
  screen -S $MP_SCREEN_NAME -X quit
end