FROM       zot.jamet.me/docker-hub/library/python:3.10-alpine

RUN        pip install pycodestyle==2.8.0
# pycodestyle is the successor of pep8; the image keeps its `pep8` command.
RUN        ln -s "$(command -v pycodestyle)" /usr/local/bin/pep8
# pycodestyle 2.3.1 warned on every run on Python >= 3.7 (FutureWarning:
# "Possible nested set" from its regexes); 2.8.0's changelog does not say that
# is fixed, so the filter stays. Keep the lint output clean.
ENV        PYTHONWARNINGS=ignore::FutureWarning:pycodestyle,ignore::DeprecationWarning:pycodestyle
ENTRYPOINT ["pep8"]
