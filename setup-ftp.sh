#!/bin/bash

groupadd ftpgroup && \
useradd -g ftpgroup -d /dev/null -s /etc ftpuser && \
mkdir /home/ftpusers && \
mkdir /home/ftpusers/joe && \
(echo test; echo test) | pure-pw useradd joe -u ftpuser -d /home/ftpusers/joe && \
pure-pw mkdb && \
ln -s /etc/pure-ftpd/pureftpd.passwd /etc/pureftpd.passwd && \
ln -s /etc/pure-ftpd/pureftpd.pdb /etc/pureftpd.pdb && \
ln -s /etc/pure-ftpd/conf/PureDB /etc/pure-ftpd/auth/PureDB && \
chown -hR ftpuser:ftpgroup /home/ftpusers/
