FROM linea-singleuser:0.3

RUN conda install --quiet --yes astropy
RUN conda install -c conda-forge healpy --yes
RUN conda install sqlparse
RUN conda install psycopg2
RUN conda install bokeh
RUN conda install datashader
RUN conda install -c conda-forge astropy-healpix
RUN conda install holoviews
RUN conda install seaborn

RUN apt-get update
RUN apt-get install stilts -y

RUN pip install --upgrade pip
RUN pip install pyfits

RUN conda install --quiet --yes emcee
RUN conda install --quiet --yes corner
RUN conda install --quiet --yes sqlalchemy

RUN pip install skymapper
RUN pip install bz2file

RUN apt-get update
RUN apt-get install gcc -y

RUN mkdir $HOME/healpix_util
COPY healpix_util_src/ $HOME/healpix_util/.

RUN /bin/bash -c 'cd $HOME/healpix_util && python setup.py install'

RUN apt-get install gfortran -y
RUN pip install gatspy lmfit ellc

RUN python -m ipykernel install --name science 

CMD ["jupyterhub-singleuser"]
