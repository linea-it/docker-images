FROM linea/jupyterhub:linea-singleuser-0.4

RUN pip install --upgrade pip

RUN apt-get update
RUN apt-get install gcc -y


RUN pip install --upgrade pip
RUN apt-get update
#GCC 
RUN apt-get install gcc -y
#FORTRAN
RUN apt-get install gfortran -y
#SORA
RUN pip install sora-astro
RUN conda install --quiet --yes cartopy

# ipympl
RUN pip install ipympl

# ipympl
RUN pip install ipympl

# kernel

RUN python -m ipykernel install --name sora

CMD ["jupyterhub-singleuser"]
