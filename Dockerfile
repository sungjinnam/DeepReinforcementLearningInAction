# starting with basic python environment
FROM python:3.6-slim
RUN apt update && apt -y install make g++ nodejs npm git

# copy existing files
RUN mkdir app
RUN mkdir app/notebooks
WORKDIR app/
COPY ./Pipfile ./Pipfile.lock /app/

# installing dependencies
RUN pip install pipenv
RUN pipenv install --system --deploy

# run jupyter lab
RUN jupyter labextension install nbdime-jupyterlab --no-build && \
    jupyter labextension install @jupyterlab/git --no-build && \
    jupyter lab build
CMD ["jupyter", "serverextension", "enable", "jupyterlab"]
CMD ["jupyter", "lab", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]
