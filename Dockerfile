FROM resin/raspberrypi3-python:3
LABEL description="Hal"
WORKDIR /app
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install webp imagemagick
ADD requirements.txt .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
RUN mkdir /data
COPY ./hangoutsbot/hangupsbot/ ./
RUN mkdir -p /root/.local/share && ln -s /data /root/.local/share/hangupsbot
CMD ["python", "hangupsbot.py"]
ARG PORTS="9001 9002 9003"
EXPOSE $PORTS
