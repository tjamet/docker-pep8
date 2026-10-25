FROM       zot.jamet.me/docker-hub/library/python:3.5-alpine

RUN        pip install pep8==1.7.1
# 1.7.1 warns on every run that pep8 is now pycodestyle; keep the lint output clean.
ENV        PYTHONWARNINGS=ignore::UserWarning:pep8
ENTRYPOINT ["pep8"]
