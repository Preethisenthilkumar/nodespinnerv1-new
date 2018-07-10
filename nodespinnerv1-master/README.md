# nodespinnerv1


## Building an image

While we don't have CI enabled on this repo you need to build image manually

```sh
docker build  -t nodespinner -f bootstrap.dockerfile .
```

## Generating config

```sh
./bootstrap.sh genconfig $PWD/staging.yml
```


## Initializing the node

Currently you need to login to private docker registry before proceeding. Init role will pull desired node revision.

```sh
./bootstrap.sh init 4c996cb28128b099ab3ce580d6d6158ac2b01133


## Running the node

```sh
./bootstrap.sh start 4c996cb28128b099ab3ce580d6d6158ac2b01133
```