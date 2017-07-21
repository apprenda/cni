FROM busybox

ADD dist/ /opt/cni/bin/

ADD scripts/install-cni.sh /install-cni.sh

CMD ["/install-cni.sh"]