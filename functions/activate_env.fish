#!/usr/env/bin fish

function activate_env -d 'Enter materials envrionment'

  set -q MP_ENVS_ROOT[1]; or set -l MP_ENVS_ROOT $HOME
  set -l env_name (string split -rm 1 '/' -- $argv[1])[-1]
  set -l env_dir (string split -rm 1 '_' -- $MP_SCREEN_NAME)[-1]
  set -l user_dir (string split -rm 1 '/' -- $argv[1])[-2]

  set -x MP_SCREEN_NAME $env_name

  if -q user_dir[1]
    set -l mp_env_root $MP_ENVS_ROOT/$user_dir/envs/$env_dir
  else
    set -l mp_env_root $MP_ENVS_ROOT/envs/$env_dir
  end

  set -x MP_CODES_ROOT $mp_env_root/codes

  if -q $argv[2]
    set -l config_path $mp_env_root/configs/$argv[2]
    set -l env_msg "Welcome to $env_name with $argv[2] config."
  else
    set -l config_path $mp_env_root/config
    set -l env_msg "Welcome to $env_name."
  end

  if [ -d $config_path ]
    set -x FW_CONFIG_FILE $config_path/FW_config.yaml
    set -x DB_LOC $config_path/../dbs
    conda activate $env_name
    echo env_msg
    echo "Config path: $config_path"
  else
    set -e MP_SCREEN_NAME MP_CODES_ROOT
    echo "Unrecognized environment or config name."
  fi

end