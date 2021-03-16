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
