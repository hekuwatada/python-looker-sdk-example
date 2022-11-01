# How to run example code for Looker Python SDK

This repo provides:
* (1) Docker container with the correct Python version required for Looker Python SDK to work
* (2) Example Python code using the Looker Python SDK
* (3) Easy way to run the example Python code in a Docker container

## Pre-requisites
- Docker
- `make`
- `black` (Optional for dev)

## Step 1: Set Looker details as environment variables in `exports.sh`

Edit `exports.sh` with:
- Looker base URL
- Looker client ID
- Looker client secret


## Step 2: Generate `looker.ini` file with your Looker details

Run below:
```
make setup
```

This will:
  * (1) generate `looker.init` file based on `looker.init.template` with environment variables populated.
  * (2) build a Docker image locally from `Dockerfile` with Python and Looker SDK.

## Step 3: Run the sample Python script in a Docker container

Run below:
```
make run
```

This will output the output of the sample Python script.

## Appendix

### How to entre a Docker container with Python and Looker SDK

To start a Docker container and entre it, run:

```
make docker/run
```

In the conatiner, run:

```
python <Python script>
```

### How to lint Python scripts

You'll need `black` to be installed locally. Run:

```
make lint
````

This will format all Python scripts in the current directory.

