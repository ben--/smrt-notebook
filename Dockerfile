FROM jupyter/scipy-notebook:03b897d05f16

RUN git clone https://github.com/jupyter-widgets/ipyleaflet.git

RUN pip install xarray

RUN cd ipyleaflet \
 && pip install -e .

RUN jupyter nbextension install --py --symlink --sys-prefix ipyleaflet \
 && jupyter nbextension enable --py --sys-prefix ipyleaflet \
 && jupyter labextension install jupyter-leaflet
