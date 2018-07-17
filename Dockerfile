FROM jupyter/scipy-notebook:702d2f6a3eaa

RUN git clone https://github.com/jupyter-widgets/ipyleaflet.git

RUN pip install xarray

RUN cd ipyleaflet \
 && pip install -e .

RUN jupyter nbextension install --py --symlink --sys-prefix ipyleaflet \
 && jupyter nbextension enable --py --sys-prefix ipyleaflet \
 && jupyter labextension install jupyter-leaflet \
 && jupyter labextension install @jupyter-widgets/jupyterlab-manager

RUN conda install jupyter_dashboards -c conda-forge
