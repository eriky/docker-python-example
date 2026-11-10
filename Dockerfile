FROM python:3.15-slim
COPY --from=ghcr.io/astral-sh/uv:0.13.7 /uv /uvx /bin/

WORKDIR /app
ENV UV_NO_DEV=1

# Install the dependencies first, so Docker can cache this layer
COPY pyproject.toml uv.lock ./
RUN uv sync --locked

# Then copy our code
COPY *.py ./

# Don't run as root inside the container
RUN useradd --create-home appuser
USER appuser

ENV PATH="/app/.venv/bin:$PATH"
CMD [ "gunicorn", "--bind", "0.0.0.0:8000", "app:app" ]
