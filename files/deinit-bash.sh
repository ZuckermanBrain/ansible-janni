# Ensure that all conda evironments are deactivated
# before uninitializing Anaconda
conda deactivate

# Remove condabin from the path
if [ -n "${_CE_CONDA+x}" ] && [ -n "${WINDIR+x}" ]; then
        CONDABINPATH="$(\dirname "$CONDA_EXE")/condabin"
else
	CONDABINPATH="$(\dirname "$(\dirname "$CONDA_EXE")")/condabin"
fi

# From https://unix.stackexchange.com/a/108933/110579
PATH=:$PATH:
PATH=${PATH//:$CONDABINPATH:/:}
PATH=${PATH#:}; PATH=${PATH%:}

unset _CE_CONDA
unset _CE_M
unset CONDA_EXE
unset CONDA_PYTHON_EXE
unset CONDA_SHLVL
unset SYSP
unset -f __add_sys_prefix_to_path
unset -f __conda_hashr
unset -f __conda_activate
unset -f __conda_reactivate
unset -f conda
unset -f CONDA_SHLVL
