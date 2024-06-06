# TestCafe (Alpine) Docker

- README.md
- Dockerfile
- testcafe-alpine.sh
- tests/script.js

## Pre-requisites

- [Docker](https://docs.docker.com/engine/install/)

## How to use (Linux or WSL)

### 1. Clone this repo

```bash
git clone https://github.com/afmpjr/testcafe-alpine.git && cd testcafe-alpine
```

### 2. Build the image

```bash
docker build -t testcafe-alpine .
```

Use the follwing in case you have any network issue.

```bash
docker build --network host -t testcafe-alpine .
```

### 3. Enable the `testcafe-alpine.sh` script

```bash
source ./testcafe-alpine.sh
```

or add to your `.bashrc`, `.zshrc` or wharever shell `rc` you´re using by running the following from the directory where `testcafe-alpine.sh` is located.

```bash
echo "source ${PWD}/testcafe-alpine.sh" >> "${HOME}/.$(basename "$SHELL")rc"
source ${HOME}/.$(basename "$SHELL")rc
```

### 4. Make sure you have tests in your `tests` directory

5. Run the tests

    ```bash
    # Runnin on multple browsers
    testcafe -v ./:/testcafe/ firefox:headless,chromium:headless /testcafe/tests

    # Runnin on Firefox + XML output
    testcafe -v ./:/testcafe/ firefox:headless /testcafe/tests --reporter spec,xunit:/testcafe/report.xml

    # Runnin on Chrome + JSON output
    testcafe -v ./:/testcafe/ chromium:headless /testcafe/tests --reporter spec,json:/testcafe/report.json
    ```

    ```bash
    # Getting the list of available browsers
    testcafe --list-browsers
    ```

    If you had any network issues on `build` step, you'll probably have issues to run
    the image as well.
    To solve that, update the `testcafe-alpine.sh` by adding `--network host` as follows:

    ```bash
        local docker_command="docker run --network host -it --rm -v $(pwd):/testcafe/ testcafe-alpine testcafe ${extra_params[*]}"
    ```

## Official TestCafe documentation

- [TestCafe documentation - API → Command Line Interface](https://testcafe.io/documentation/402639/reference/command-line-interface)
- [TestCafe documentation - Guides → Reporters](https://testcafe.io/documentation/402825/guides/intermediate-guides/reporters)

## Open to Contributors

If you’d like to help improving this project, feel free to:

- Fork the repository.
- Make your changes.
- Submit a pull request.
