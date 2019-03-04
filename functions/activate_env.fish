#!/usr/env/bin fish

function activate_env -d 'Enter materials envrionment'

  set -q MP_ENVS_ROOT[1]; or set MP_ENVS_ROOT $HOME
  set env_name (string split -rm 1 '/' -- $argv[1])[-1]
  set env_dir (string split -rm 1 '_' -- $env_name)[-1]
  set user_dir (string split -rm 1 '/' -- $argv[1])[-2]

  set -gx MP_SCREEN_NAME $env_name

  if set -q user_dir[1]
    set mp_env_root $MP_ENVS_ROOT/$user_dir/envs/$env_dir
  else
    set mp_env_root $MP_ENVS_ROOT/envs/$env_dir
  end
  echo $mp_env_root

  set -gx MP_CODES_ROOT $mp_env_root/codes

  if set -q $argv[2]
    set config_path $mp_env_root/config
    set env_msg "Welcome to $env_name."
  else
    set config_path $mp_env_root/configs/$argv[2]
    set env_msg "Welcome to $env_name with $argv[2] config."
  end
  echo $config_path

  if [ -d $config_path ]
    set -gx FW_CONFIG_FILE $config_path/FW_config.yaml
    set -gx DB_LOC $config_path/../dbs
    conda activate $env_name
    echo $env_msg
    echo "Config path: $config_path."
  else
    for e in MP_SCREEN_NAME MP_CODES_ROOT
      set -e $e
    end
    echo "Unrecognized environment or config name."
  end

end