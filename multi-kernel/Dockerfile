FROM linea-singleuser

ENV ORIG_PATH $PATH

RUN conda create -n galaxy_evolution_py3 python=3.6 --yes

RUN conda create -n galaxy_evolution_py2 python=2 --yes

#ENV PATH /opt/conda/envs/galaxy_evolution_py3/bin:$ORIG_PATH

#RUN conda install ipykernel
RUN /bin/bash -c 'source activate galaxy_evolution_py3 && \
conda install ipykernel && \
python -m ipykernel install --name galaxy_evolution_py3'


RUN /bin/bash -c 'source activate galaxy_evolution_py2 && \
conda install ipykernel'

RUN wget http://cxc.harvard.edu/contrib/cosmocalc/downloads/cosmocalc-0.1.2.tar.gz
RUN tar xvzf cosmocalc-0.1.2.tar.gz
RUN /bin/bash -c "source activate galaxy_evolution_py2 && \
cd cosmocalc-0.1.2 && python setup.py install && \
python -m ipykernel install --name galaxy_evolution_py2"

RUN apt-get update
RUN apt-get install texlive-full pandoc --no-install-recommends -y

RUN /bin/bash -c 'source activate galaxy_evolution_py3 && \
conda install ipywidgets && \
python -m ipykernel install --name galaxy_evolution_py3 && \
jupyter nbextension enable --py widgetsnbextension --sys-prefix'


RUN /bin/bash -c 'conda install widgetsnbextension'

CMD ["jupyterhub-singleuser"]
