FROM python:3.6.3-stretch

# Install Jupyter, JupyterLab and additional packages
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt && \
    jupyter nbextension enable --py widgetsnbextension && \
    jupyter serverextension enable --py jupyterlab

ENV LANG=C.UTF-8

# Expose Jupyter port & cmd
EXPOSE 8888
RUN mkdir -p /opt/app/data

CMD jupyter lab --allow-root --ip=* --port=8888 --no-browser --notebook-dir=/opt/app/data