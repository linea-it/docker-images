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

RUN wget http://eups.linea.gov.br/jupyterhub/healpix_util/healpix_util-0.1.tar.gz
RUN tar xf healpix_util-0.1.tar.gz
RUN /bin/bash -c 'cd $HOME/healpix_util-0.1 && python setup.py install'

RUN apt-get update
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

# easyaccess

RUN apt-get update
RUN apt-get install make libssl1.0.0 libaio1 -y
RUN conda install --quiet --yes fitsio
RUN pip install easyaccess
RUN wget http://eups.linea.gov.br/jupyterhub/oracleclient/oracleclient-11.2.0.3.0.tar.gz
RUN tar xf oracleclient-11.2.0.3.0.tar.gz
RUN cp -r oracleclient-11.2.0.3.0 /opt/oracleclient
ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/opt/oracleclient/lib/
ENV C_INCLUDE_PATH $C_INCLUDE_PATH:/opt/oracleclient/include/
ENV PATH $PATH:/opt/oracleclient/bin/
ENV ORACLE_HOME /opt/oracleclient/lib/

# pyccl

RUN apt-get install cmake swig libgsl-dev libfftw3-dev -y
RUN apt-get install g++ -y
RUN apt-get install patch -y
RUN /bin/bash -c 'export CC=gcc && pip install pyccl'

# classy

RUN pip install cython
RUN wget https://github.com/lesgourg/class_public/archive/v2.7.2.tar.gz
RUN tar xf v2.7.2.tar.gz
RUN /bin/bash -c 'cd class_public-2.7.2/ &&\
make class && make &&\
cd python &&\
python setup.py install'


# batman

RUN pip install batman-package

# PyAstronomy

RUN pip install quantities PyAstronomy

# sextractor

RUN apt-get install -y sextractor

#Sklearn

RUN conda install --quiet --yes scikit-learn

#Rebound

RUN pip install rebound

#des-process

RUN pip install des-process


# kernel

RUN python -m ipykernel install --name science 

CMD ["jupyterhub-singleuser"]
