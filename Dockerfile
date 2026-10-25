FROM       zot.jamet.me/docker-hub/library/python:3.10-alpine

RUN        pip install pycodestyle==2.13.0
# pycodestyle is the successor of pep8; the image keeps its `pep8` command.
RUN        ln -s "$(command -v pycodestyle)" /usr/local/bin/pep8
ENTRYPOINT ["pep8"]
