FROM python:3.6.3-stretch

# Install Jupyter
RUN pip install jupyter
RUN pip install ipywidgets
RUN jupyter nbextension enable --py widgetsnbextension

# Install JupyterLab
RUN pip install jupyterlab && jupyter serverextension enable --py jupyterlab

ENV LANG=C.UTF-8

# Install Python Packages & Requirements
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

# Expose Jupyter port & cmd
EXPOSE 8888
RUN mkdir -p /opt/app/data

CMD jupyter lab --allow-root --ip=* --port=8888 --no-browser --notebook-dir=/opt/app/data