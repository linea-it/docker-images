FROM linea/jupyterk8s:linea-singleuser-1.3.0

RUN apt-get update
RUN apt-get update && apt-get install vim unzip -y

# rise
RUN conda install --quiet --yes rise -c conda-forge

RUN conda install --quiet --yes numpy==1.19.4 -c conda-forge

RUN conda install --quiet --yes scipy==1.6.0 -c conda-forge

RUN conda install --quiet --yes matplotlib==3.3.4 -c conda-forge

RUN conda install --quiet --yes pandas==1.2.5 -c conda-forge

RUN conda install --quiet --yes seaborn==0.11.1 -c conda-forge

# kernel
RUN python -m ipykernel install --name minicurso-ed2

CMD ["jupyterhub-singleuser"]
