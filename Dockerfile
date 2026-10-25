FROM       zot.jamet.me/docker-hub/library/python:3.7-alpine

RUN        pip install pep8==1.7.1
# pep8 1.7.1 warns on every run: UserWarning (pep8 is now pycodestyle) and, since
# Python 3.7, FutureWarning/DeprecationWarning from its regexes. Keep the lint output
# clean; this goes away with the pycodestyle hop.
ENV        PYTHONWARNINGS=ignore::UserWarning:pep8,ignore::FutureWarning:pep8,ignore::DeprecationWarning:pep8
ENTRYPOINT ["pep8"]
