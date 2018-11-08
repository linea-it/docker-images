FROM linea-singleuser:0.3

RUN conda install --quiet --yes astropy
RUN conda install -c conda-forge healpy --yes
RUN conda install sqlparse
RUN conda install psycopg2
RUN conda install bokeh
RUN conda install datashader
RUN conda install -c conda-forge astropy-healpix
RUN conda install holoviews

RUN python -m ipykernel install --name jupyter-vac

COPY jupyter-vac.sh /usr/local/bin/jupyter-vac.sh

CMD ["/usr/local/bin/jupyter-vac.sh"]
