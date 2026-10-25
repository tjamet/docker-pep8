docker-pep8
===========

This is a containerized version of the pep8 linter. pep8 was renamed
[pycodestyle](https://github.com/PyCQA/pycodestyle), its maintained successor: the
image now runs pycodestyle behind the unchanged `pep8` command.

Usage:
`docker run --rm -v $PWD:$PWD:ro -w $PWD tjamet/pep8`
Where you should run on a localhost:
`pep8`

Differences from pep8 1.7.1 (pycodestyle 2.1.0)
-----------------------------------------------

- New check E275: missing whitespace after keyword on `from ... import ...` lines.
- W503 (line break before binary operator) is in the default ignore list.
- A project level `.pep8` configuration file is no longer read; use `setup.cfg`
  or `tox.ini` (`[pycodestyle]`).
- Binary versus unary operator detection is fixed (`~` is no longer binary), which
  changes E225/E226-family results on such lines.
- E302 is reported for blank lines before `async def`, and two blank lines are
  required after a top-level `def` or `class`.
- New checks E742/E743 (functions and classes named `l`, `O` or `I`), E741 also
  on `global` and `nonlocal`, and E722 (bare `except`).
- The `[pep8]` configuration section is deprecated in favour of `[pycodestyle]`.
