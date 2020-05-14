FROM python:3.7.6-slim-stretch
RUN pip install piping
ENV PROJECT_DIR /app
WORKDIR ${PROJECT_DIR}
COPY Pipfile Pipfile.lock ${PROJECT_DIR}/
RUN pipenv install --system --deploy