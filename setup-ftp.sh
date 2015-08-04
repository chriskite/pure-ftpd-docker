#!/bin/bash
groupadd ftpgroup && \
useradd -g ftpgroup -d /dev/null -s /etc ftpuser && \
mkdir /home/ftpusers

while IFS=: read u p
do
    mkdir -p /home/ftpusers/$u
    (echo $p; echo $p) | pure-pw useradd $u -u ftpuser -d /home/ftpusers/$u 2>&1 > /dev/null
done < /tmp/virtual-users

pure-pw mkdb && \
ln -s /etc/pure-ftpd/pureftpd.passwd /etc/pureftpd.passwd && \
ln -s /etc/pure-ftpd/pureftpd.pdb /etc/pureftpd.pdb && \
ln -s /etc/pure-ftpd/conf/PureDB /etc/pure-ftpd/auth/PureDB && \
chown -hR ftpuser:ftpgroup /home/ftpusers/
