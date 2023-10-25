# Container image that runs your code
FROM python:3.11-bullseye

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

#RUN pip3 install --pre -U woke
#RUN pip3 install temp-wake-detectors

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
