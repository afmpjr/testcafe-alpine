# TestCafe (Alpine) Docker

- README.md
- Dockerfile
- testcafe-alpine.sh
- tests/script.js

## How to use

1. Build the image

    ```bash
    docker build -t testcafe-alpine .
    ```

2. source `testcafe-alpine.sh` and/or add to your `.bashrc` or `.zshrc`

3. Make sure you have tests in your `tests` directory

4. Run the tests

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

## Official TestCafe documentation

- [TestCafe documentation - API → Command Line Interface](https://testcafe.io/documentation/402639/reference/command-line-interface)
- [TestCafe documentation - Guides → Reporters](https://testcafe.io/documentation/402825/guides/intermediate-guides/reporters)
