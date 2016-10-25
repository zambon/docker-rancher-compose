# Dockerized Rancher Compose

Got tired of Go 1.6 segfaults in macOS Sierra.

## Setup

1.  Add this to `~/.profile` or equivalent.

    ```shell
    alias rancher-compose="docker run --rm -it \
      --env \"COMPOSE_FILE=$COMPOSE_FILE\" \
      --env \"COMPOSE_PROJECT_NAME=$COMPOSE_PROJECT_NAME\" \
      --env \"RANCHER_URL=$RANCHER_URL\" \
      --env \"RANCHER_ACCESS_KEY=$RANCHER_ACCESS_KEY\" \
      --env \"RANCHER_SECRET_KEY=$RANCHER_SECRET_KEY\" \
      --volume \"$(pwd):/compose\" \
      zambon/rancher-compose:0.9.2"
    ```

1.  Open a new shell and test it.

    ```shell
    rancher-compose --version
    ```

Note: To override the alias and and use the original `rancher-compose` binary, you can use `\rancher-compose`.

## Usage

Change directory into the folder that contains `docker-compose.yml` and `rancher-compose.yml` and use `rancher-compose` (almost) normally.

One limitation is that you cannot refer to files that are in parent directories of _CWD_ (e.g.: the command below _will not work_).

```shell
rancher-compose -e ../env-file up
```
