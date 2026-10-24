FROM python:latest

WORKDIR /home/choreouser

EXPOSE 3000

COPY files/* /home/choreouser/

ENV PM2_HOME=/tmp

RUN apt update &&\
    apt install --only-upgrade linux-libc-dev &&\
    apt-get install -y iproute2 vim netcat-openbsd &&\
    addgroup --gid 10008 choreo &&\
    adduser --disabled-password  --no-create-home --uid 10008 --ingroup choreo choreouser &&\
    usermod -aG sudo choreouser &&\
    chmod +x app.py start.sh swith web server

CMD [ "python", "app.py" ]

USER 10008
