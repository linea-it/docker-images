FROM linea/jupyterhub:linea-singleuser-0.4

RUN pip install --upgrade pip

RUN apt-get update
RUN apt-get install gcc -y

RUN pip install numpy matplotlib astropy \
astroquery spiceypy scipy cython rebound \
lmfit numdifftools emcee pandas bokeh corner seaborn \
scikit-learn scikit-image glob2 urllib3

RUN conda install --quiet --yes cartopy

RUN pip install --upgrade --pre astroquery

# SORA

RUN wget http://eups.linea.gov.br/jupyterhub/sora/sora-0.1.1.tar.gz
RUN tar xf sora-0.1.1.tar.gz
RUN /bin/bash -c 'cd $HOME/sora-0.1.1 && python setup.py install'

# kernel

RUN python -m ipykernel install --name ton

CMD ["jupyterhub-singleuser"]
