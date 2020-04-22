#!/bin/bash

# Add local user
# Either use the LOCAL_USER_ID if passed in at runtime or
# fallback

USER_ID=${LOCAL_USER_ID:-9001}
GROUP_ID=${LOCAL_GROUP_ID:-9001}

echo "Starting with UID : $USER_ID"
echo "Starting with GID : $GROUP_ID"

groupadd -g $GROUP_ID des-brazil

useradd --shell /bin/bash -u $USER_ID -g $GROUP_ID -o -c "" -m jovyan

export HOME=/home/jovyan
cd $HOME
HOMEDIR=$HOME/homedir

chown jovyan /mnt/homedir
ln -s /mnt/homedir $HOMEDIR


if [ -n "${REPO_NAME}" ]; then
    chown jovyan /mnt/${REPO_NAME}
    ln -s /mnt/${REPO_NAME} $HOME/${REPO_NAME}
fi


# .gitconfig
if [ -n "${LOCAL_GITCONFIG}" ]; then
    ln -s $HOMEDIR/.gitconfig $HOME/.gitconfig
fi

# .ssh
if [ -n "${LOCAL_SSHDIR}" ]; then
    ln -s $HOMEDIR/.ssh $HOME/.ssh
fi

# Public notebooks

ln -s /archive/notebooks $HOME/notebooks

exec gosu jovyan "$@"

