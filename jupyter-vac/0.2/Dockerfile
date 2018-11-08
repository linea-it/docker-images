FROM linea-singleuser:0.3

RUN conda install ipykernel sqlalchemy sqlparse psycopg2 matplotlib --yes
RUN conda install -c conda-forge healpy --yes

RUN python -m ipykernel install --name jupyter-vac

COPY jupyter-vac.sh /usr/local/bin/jupyter-vac.sh

CMD ["/usr/local/bin/jupyter-vac.sh"]
