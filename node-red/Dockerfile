#armhf:FROM nodered/node-red-docker:rpi
#amd64:FROM nodered/node-red-docker:latest

WORKDIR /usr/src/node-red

USER root

RUN apt-get update && apt-get install -y jq

# Expose tcp/1880
EXPOSE 1880

# Environment variable holding file path for flows configuration
ENV FLOWS=flows.json

COPY settings.js /
COPY run.sh /
RUN chmod a+x /run.sh
CMD [ "/run.sh" ]
