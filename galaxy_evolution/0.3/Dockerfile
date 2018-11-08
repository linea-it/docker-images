FROM linea-singleuser:0.3

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

RUN apt-get install gcc -y

RUN mkdir $HOME/healpix_util
COPY healpix_util_src/ $HOME/healpix_util/.

#RUN echo "root:102030" | chpasswd

# Python 3 kernel
RUN /bin/bash -c 'source activate galaxy_evolution_py3 && \
conda install healpy bokeh && \
cd $HOME/healpix_util && python setup.py install && \
python -m ipykernel install --name galaxy_evolution_py3'

# Python 2 kernel
RUN /bin/bash -c 'source activate galaxy_evolution_py2 && \
conda install healpy bokeh && \
cd $HOME/healpix_util && python setup.py install && \
python -m ipykernel install --name galaxy_evolution_py2'

WORKDIR $HOME

CMD ["jupyterhub-singleuser"]
