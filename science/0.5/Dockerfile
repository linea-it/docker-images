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

# GCR Install

RUN pip install GCR h5py
RUN wget https://github.com/LSSTDESC/gcr-catalogs/archive/v0.10.1.tar.gz
RUN tar xf v0.10.1.tar.gz
RUN /bin/bash -c 'cd gcr-catalogs-0.10.1/ &&\
cp GCRCatalogs/catalog_configs/cosmoDC2_v1.1.4_small.yaml . &&\
sed -i "/^catalog_root_dir:/c\catalog_root_dir: /archive/lsst/dc2/cosmoDC2_v1.1.4_small" cosmoDC2_v1.1.4_small.yaml &&\
rm GCRCatalogs/catalog_configs/*.yaml &&\
mv cosmoDC2_v1.1.4_small.yaml GCRCatalogs/catalog_configs/. &&\
python setup.py build &&\
python setup.py install'

RUN apt-get update
RUN apt-get install dvipng -y

RUN python -m ipykernel install --name science 

CMD ["jupyterhub-singleuser"]
