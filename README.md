## Build
```bash
$ docker build -t coisa/env-diff .
```

## Run

### Diff .env.dist
```bash
$ docker run -it --rm -v $PWD:/usr/local/src coisa/env-diff
```
### Diff .env.example
```bash
$ docker run -it --rm -v $PWD:/usr/local/src coisa/env-diff diff .env.example
```
### Update .env.dist
```bash
$ docker run -it --rm -v $PWD:/usr/local/src coisa/env-diff actualize 
```
### Update .env.example
```bash
$ docker run -it --rm -v $PWD:/usr/local/src coisa/env-diff actualize .env.example
```

## Git hooks

You can use Git hook that gets triggered after any 'git pull' whenever one of the files specified has changed. Useful to update any web application dependency or sync configuration.
Create post-merge hook in .git/hooks directory of your project:

```
#/usr/bin/env bash

changed_files="$(git diff-tree -r --name-only --no-commit-id ORIG_HEAD HEAD)"

check_run() {
    echo "$changed_files" | grep -E --quiet "$1" && eval "$2"
}

# Actualize env files if the `env.dist` file gets changed
check_run env.dist "docker run -it --rm -v $PWD:/usr/local/src coisa/env-diff actualize"
```
