FROM jupyterhub/singleuser:1.3.0

ENV HOME=/root
WORKDIR $HOME

USER root
RUN userdel jovyan
RUN rm -r /home/jovyan

RUN apt-get update && apt-get -y --no-install-recommends install \
    gosu \
    curl

RUN apt-get install git -y --no-install-recommends

COPY README.txt /etc/skel/README.txt

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

RUN /bin/bash -c 'conda install widgetsnbextension ipywidgets --yes'

RUN apt-get update && apt-get install texlive-xetex pandoc --no-install-recommends -y

RUN apt-get install texlive-fonts-recommended --no-install-recommends -y
#RUN apt-get install texlive-generic-recommended --no-install-recommends -y

RUN pip install jupyterlab==2.3.1

RUN jupyter labextension install @jupyterlab/toc

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

