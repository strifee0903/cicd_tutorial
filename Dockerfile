FROM ubuntu:latest
MAINTAINER Tuan Thai "tuanthai@example.com"
RUN apt update -y
RUN apt install -y python3-pip python3-dev python3-venv build-essential
WORKDIR /flask_app
COPY requirements.txt /flask_app/
RUN python3 -m venv myenv
RUN /flask_app/myenv/bin/pip install --no-cache-dir -r requirements.txt
COPY . /flask_app/
ENTRYPOINT ["/flask_app/myenv/bin/python"]
CMD ["flask_docker.py"]
