FROM jupyterhub/singleuser

ENV HOME=/root
WORKDIR $HOME

USER root
RUN userdel jovyan
RUN rm -r /home/jovyan

RUN apt-get update && apt-get -y --no-install-recommends install \
    gosu \
    curl

RUN apt-get install git -y --no-install-recommends

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
