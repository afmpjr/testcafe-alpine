# TestCafe (Alpine) Docker

- Dockerfile
- testcafe-alpine.sh
- tests/script.js

## How to use

### to get a JSON output

```bash
docker run -it --rm -v ./tests:/testcafe/tests testcafe-alpine testcafe --color firefox:headless ./tests --reporter spec,json:/testcafe/tests/report.json
```

### to use Chromium and get a JSON output

```bash
testcafe -source ./ -browser chromium:headless -target tests -output report.json
```

### to use Firfox and get a XML output

```bash
testcafe -source ./ -browser firefox:headless -target tests -output report.xml
```

> [TestCafe documentation - Guides → Reporters](https://testcafe.io/documentation/402825/guides/intermediate-guides/reporters)
