FROM linea-singleuser

ENV ORIG_PATH $PATH

RUN conda create -n galaxy_evolution_py3 python=3.6 --yes

RUN conda create -n galaxy_evolution_py2 python=2 --yes

# Python 3 kernel
RUN /bin/bash -c 'source activate galaxy_evolution_py3 && \
conda install ipykernel numpy scipy matplotlib astropy pandas seaborn && \
python -m ipykernel install --name galaxy_evolution_py3'

# Python 2 kernel
RUN /bin/bash -c 'source activate galaxy_evolution_py2 && \
conda install ipykernel numpy scipy matplotlib astropy pandas seaborn'

RUN wget http://cxc.harvard.edu/contrib/cosmocalc/downloads/cosmocalc-0.1.2.tar.gz
RUN tar xvzf cosmocalc-0.1.2.tar.gz
RUN /bin/bash -c "source activate galaxy_evolution_py2 && \
cd cosmocalc-0.1.2 && python setup.py install && \
python -m ipykernel install --name galaxy_evolution_py2"


CMD ["jupyterhub-singleuser"]
