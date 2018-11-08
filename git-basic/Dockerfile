FROM python:3.6
RUN pip3 install \
    jupyterhub==0.9 \
    'notebook'

# create a user, since we don't want to run as root
RUN useradd -m jovyan
ENV HOME=/home/jovyan
WORKDIR $HOME
RUN mkdir repo
RUN mkdir homedir
RUN chown jovyan:jovyan repo
USER jovyan

CMD ["jupyterhub-singleuser"]
