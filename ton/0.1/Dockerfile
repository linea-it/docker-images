FROM linea/jupyterhub:linea-singleuser-0.4

RUN pip install --upgrade pip

RUN apt-get update
RUN apt-get install gcc -y

RUN pip install numpy matplotlib astropy \
astroquery spiceypy scipy cython rebound \
lmfit numdifftools emcee pandas bokeh corner seaborn \
scikit-learn scikit-image glob2 urllib3

RUN conda install --quiet --yes cartopy

RUN pip install --pre astroquery

# kernel

RUN python -m ipykernel install --name ton

CMD ["jupyterhub-singleuser"]
