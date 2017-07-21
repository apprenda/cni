# CNI
A docker container that will copy the CNI [binaries](https://github.com/containernetworking/cni) to a voume mounted to `/host/opt/cni/bin`

By default the container will NOT overwrite if a binary is already present, use `-e OVERWRITE=true` to overwrite the existing binary. 

```
docker run -v /opt/cni/bin:/host/opt/cni/bin dimitrikoshkin/cni-bin
```