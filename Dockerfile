FROM python
COPY requirments.txt  /project/requirments.txt

RUN python3 -m venv /opt/env
RUN /opt/env/bin/pip install -r /project/requirments.txt

COPY ./src /project/src/

WORKDIR /project

RUN  /opt/env/bin/python /project/src/manage.py migrate || true

CMD /opt/env/bin/python /project/src/manage.py runserver 0.0.0.0:8000
