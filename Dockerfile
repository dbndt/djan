FROM python:3.8.10
RUN mkdir -p /opt/services/djangoapp/src
WORKDIR /opt/services/djangoapp/src
COPY Pipfile Pipfile.lock /opt/services/djangoapp/src/
RUN pip install -U pipenv && pipenv install --system
COPY . /opt/services/djangoapp/src
EXPOSE 8000
CMD ["gunicorn", "--chdir", "matplan", "--bind", ":8000", "matplan.wsgi:application"]
