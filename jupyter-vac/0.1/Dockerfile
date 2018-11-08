FROM linea-singleuser

RUN conda create -n jupyter-vac python=3.6 --yes
RUN /bin/bash -c "source activate jupyter-vac"
RUN conda install ipykernel sqlalchemy sqlparse psycopg2 matplotlib --yes
RUN conda install -c conda-forge healpy --yes

RUN python -m ipykernel install --name jupyter-vac

RUN apt-get install openssh-client -y

RUN conda install widgetsnbextension --yes

RUN conda install ipywidgets --yes

CMD ["jupyterhub-singleuser"]
