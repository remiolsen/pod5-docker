FROM mambaorg/micromamba

LABEL author="Remi-Andre Olsen" \
      maintainer="remi-andre.olsen@scilifelab.se" \
      homepage="https://github.com/remiolsen/"

USER root
COPY --chown=$MAMBA_USER:$MAMBA_USER environment.yml /
RUN micromamba env create -n pod5 && micromamba install -y -n pod5 -f /environment.yml && micromamba clean --all --yes 
ENV PATH /opt/conda/envs/pod5/bin:$PATH

