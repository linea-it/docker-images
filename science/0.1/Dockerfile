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

RUN python -m ipykernel install --name science 

CMD ["jupyterhub-singleuser"]
