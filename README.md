# os-builder

## build os-builder Docker image

```
docker build -t crunos/os-builder https://github.com/dengleros/os-builder.git#main
```

## build packages

```
docker run --rm -ti \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-v $(pwd):$(pwd) \
	-w $(pwd) \
	crunos/os-builder:latest \
	pkg build -disable-content-trust -org crunos --force -hash latest \
  	<PKG_REPO>[#PKG_REPO_BRANCH]
```

## build os

```
docker run --rm -ti \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-v $(pwd):$(pwd) \
	-w $(pwd) \
  	crunos/os-builder:latest \
  	build -dir out/ dengleros.yml
```

## run os (qemu)

```
docker run --rm -ti \
  	--device /dev/kvm \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-v $(pwd):$(pwd) \
	-w $(pwd) \
  	crunos/os-builder:latest \
	run qemu -disk "disk.img,size=10G,format=qcow2" out/dengleros
```

