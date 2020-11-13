#!/bin/zsh
# shellcheck shell=bash

export BORG_REPO="/run/media/swerner/BACKUP/$(hostname)"

info() { printf "\n%s %s\n\n" "$( date )" "$*" >&2; }
trap "echo $( date ) Backup interrupted >&2; exit 2" INT TERM

if [ -z "$BORG_PASSPHRASE" ]; then
    echo -n 'Repo passphrase:'
    read -s BORG_PASSPHRASE
    export BORG_PASSPHRASE
    echo
fi

info "Starting backup"

borg create                                     \
    --stats                                     \
    --verbose                                   \
    --filter AME                                \
    --list                                      \
    --show-rc                                   \
    --compression zstd,15                       \
    --exclude-caches                            \
    --exclude-nodump                            \
    --exclude-from $HOME/.borg-exclude          \
                                                \
    ::'{hostname}-{now}'                        \
    "${HOME}"                                   \

backup_exit=$?

info "Pruning repository"

borg prune                          \
    --verbose                       \
    --list                          \
    --prefix '{hostname}-'          \
    --show-rc                       \
    --keep-daily    7               \
    --keep-weekly   4               \
    --keep-monthly  6               \

prune_exit=$?

# use highest exit code as global exit code
global_exit=$(( backup_exit > prune_exit ? backup_exit : prune_exit ))

if [ ${global_exit} -eq 0 ]; then
    info "Backup and Prune finished successfully"
elif [ ${global_exit} -eq 1 ]; then
    info "Backup and/or Prune finished with warnings"
else
    info "Backup and/or Prune finished with errors"
fi

exit ${global_exit}
