FROM python:3.6
RUN mkdir -p /opt/services/djangoapp/src
WORKDIR /opt/services/djangoapp/src
RUN pip install -U --upgrade pip
RUN pip install -U gunicorn django
COPY . /opt/services/djangoapp/src
EXPOSE 8000
CMD ["gunicorn", "--chdir", "matplan", "--bind", ":8000", "matplan.wsgi:application"]
