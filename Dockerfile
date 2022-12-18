FROM python:3.8 as builder

ENV DOCKER_DEFAULT_PLATFORM=linux/amd64

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

ENV PYTHONPATH="$PYTHONPATH:/usr/src/app/:/usr/src/app/modules/"

RUN apt-get update
RUN apt-get install -y build-essential libpq-dev

WORKDIR /wheels

COPY ./requirements.txt /wheels

RUN pip install -U pip && \
    pip wheel -r ./requirements.txt

FROM python:3.8

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV APP_HOME=/home/app/web

COPY --from=builder /wheels /wheels
RUN pip install -U pip \
    && pip install --no-cache-dir \
        -r /wheels/requirements.txt \
        -f /wheels \
    && rm -rf /wheels

RUN mkdir -p /home/app
RUN mkdir -p /home/app/web

WORKDIR /home/app/web

COPY . /home/app/web

EXPOSE 8000

CMD sh /home/app/web/entrypoint.sh