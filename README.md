# os-builder

## build os-builder Docker image

```
docker build -t crunos/os-builder https://github.com/crunos/os-builder.git#main
```

## build packages

### local build package

```
docker run --rm -ti \
	-v ~/.docker:/root/.docker \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-v $(pwd):$(pwd) \
	-w $(pwd) \
	crunos/os-builder:latest \
	pkg build -disable-content-trust -org crunos --force -hash latest \
  	<SUB-/PATH_IN_PWD>
```

### remote build package

```
docker run --rm -ti \
	-v ~/.docker:/root/.docker \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-v $(pwd):$(pwd) \
	-w $(pwd) \
	crunos/os-builder:latest \
	pkg build -disable-content-trust -org crunos --force -hash latest \
  	<GIT_PKG_REPO>#<PKG_REPO_BRANCH]/[PKG_REPO_SUBDIR]
```

## build os

### local build

```
docker run --rm -ti \
	-v ~/.docker:/root/.docker \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-v $(pwd):$(pwd) \
	-w $(pwd) \
  	crunos/os-builder:latest \
  	build -dir out/ crunos.yml
```

### remote build

```
docker run --rm -ti \
	-v ~/.docker:/root/.docker \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-v $(pwd):$(pwd) \
	-w $(pwd) \
  	crunos/os-builder:latest \
  	build \
	https://github.com/crunos/dist.git#main/crunos.yml
```

## run os (qemu)

```
docker run --rm -ti \
	-v ~/.docker:/root/.docker \
  	--device /dev/kvm \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-v $(pwd):$(pwd) \
	-w $(pwd) \
  	crunos/os-builder:latest \
	run qemu -disk "disk.img,size=10G,format=qcow2" crunos
```

