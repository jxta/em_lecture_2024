FROM jupyter/datascience-notebook
USER root
RUN apt-get update; apt-get install pip graphviz -y
RUN pip install jupyter jupyterhub
RUN pip install networkx
RUN pip install graphillion graphviz



ARG NB_USER=jovyan
ARG NB_UID=1000
ENV USER ${NB_USER}
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}

COPY . ${HOME}
USER root
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}
