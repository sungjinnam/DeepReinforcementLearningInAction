# starting with basic python environment
FROM python:3.6-slim
RUN apt update && apt -y install make g++ nodejs npm git

# copy existing files
RUN mkdir app
RUN mkdir app/notebooks
WORKDIR /app
COPY ./Pipfile ./Pipfile.lock /app/

# installing dependencies
RUN pip install pipenv
RUN pipenv install --system --deploy

# installing MAgent
RUN git clone https://github.com/geek-ai/MAgent.git && \
    apt -y install cmake libboost-system-dev libjsoncpp-dev libwebsocketpp-dev && \
    cd MAgent && \
    bash build.sh
ENV PYTHONPATH /app/MAgent/python

RUN jupyter serverextension enable jupyterlab && \
    jupyter lab build --minimize=False --dev-build=False
CMD ["jupyter", "lab", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]
