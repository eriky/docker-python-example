# docker-python-example

A small Flask web service that runs in a Docker image, with a test and a CI/CD pipeline. It's the companion repository to two free articles on Python Land:

- [Containerize your Python project with Docker](https://python.land/deployment/containerize-your-project) builds the app and its Dockerfile, step by step.
- [Automatically build and deploy your Python application with CI/CD](https://python.land/deployment/ci-cd-automatically-build-and-deploy-your-python-application) adds the test and the GitHub Actions workflow in `.github/workflows/ci.yml`.

Both are part of the [Python tutorial](https://python.land/python-tutorial) at Python Land.

## Run it

With [uv](https://docs.astral.sh/uv/):

```
uv run gunicorn --bind 0.0.0.0:8000 app:app
```

With Docker, build the image yourself:

```
docker build -t my_webservice .
docker run -p 8000:8000 my_webservice
```

or run the image this repository's pipeline publishes:

```
docker run -p 8000:8000 ghcr.io/eriky/docker-python-example:latest
```

Then open http://localhost:8000.

## Test it

```
uv run pytest
```

Every push to `main` runs the tests and the Ruff linter on GitHub Actions. When they pass, the pipeline builds the image for amd64 and arm64 and publishes it to the GitHub Container Registry.

Before November 2026 this repository used Pipenv. That version is still in the Git history.
