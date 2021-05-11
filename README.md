# Questionnaire app

## Getting Started

To get a local copy up and running:

```bash
git clone https://github.com/vcc-LG/perfect-ward-code.git
cd perfect-ward-code
```
then
```bash
docker-compose up --build
```

You can view candidate scores and complete questionnaires at `localhost:3000/questionnaires`

## Tests

You can run the test suite using:
```bash
docker-compose run web rake test
```