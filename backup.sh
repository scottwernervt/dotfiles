#!/usr/bin/env bash
# shellcheck shell=bash
# 
# Recreate local and remote repo - https://github.com/kopia/kopia/issues/2007
# 1. kopia repository create filesystem --path=<path-to-repo>
# 2. kopia repository sync-to b2 --bucket= --key-id= --key=
#
# Mount snapshot
# 1. 

set -e
trap 'echo "Command filed with exit code $?."' EXIT

PHYSICAL_REPO="/run/media/scwerner/BACKUP-01/scwerner/tinkerframe/repo"
B2_BUCKET_NAME="tinkerframe-backup"

echo "Checking if ${PHYSICAL_REPO} is mounted."
if [ ! -d "$PHYSICAL_REPO" ]; then
	echo "${PHYSICAL_REPO} not found, exiting!"
	exit 1
fi

# Prompt for repository password
if [ -z "$KOPIA_PASSWORD" ]; then
	read -sp 'Repo passphrase: ' KOPIA_PASSWORD
	echo
	export KOPIA_PASSWORD
fi

# Create snapshot on external
echo "Creating snapshot at ${PHYSICAL_REPO}."
kopia snapshot create $HOME

# Sycncing snapshot to cloud storage
echo "Syncing backup to Backblaze B2 Cloud Storage."
read -sp 'Backblaze B2 Key ID: ' b2_key_id
echo
read -sp 'Backblaze B2 Key: ' b2_key 
echo
kopia repository sync-to b2 \
	--bucket=tinkerframe-backup \
	--key-id=$b2_key_id \
	--key=$b2_key \
	--must-exist \
	--delete

kopia content stats
