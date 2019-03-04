#!/usr/env/bin fish

function update_codes -d 'Update packages from local git repos'
  if set -q $argv[1]
    code_path=$MP_CODES_ROOT/$i
    if [ -d $code_path ]
      echo -e "\nUpdating $i in $code_path:"
      cd $code_path
      git pull
      pip install -e .
      cd $OLDPWD
    fi
  else
    conda upgrade --all -y
    conda clean --index-cache --packages --tarballs -y
    set -l modules_backup $LOADEDMODULES
    module purge
    for i in pymatgen pymatgen-db fireworks custodian atomate mpworks
      update_codes $i
    end
    module load (string split ':' -- $modules_backup)
  fi
end