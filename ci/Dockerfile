FROM python:3.8-slim as base
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONFAULTHANDLER 1

FROM base AS python-deps
RUN pip install pipenv
RUN apt-get update \
    && apt-get install -y --no-install-recommends gcc openssh-client
COPY Pipfile .
COPY Pipfile.lock .
RUN PIPENV_VENV_IN_PROJECT=1 pipenv install --deploy

FROM base AS runtime
COPY --from=python-deps /usr/bin/ssh /usr/bin/ssh
COPY --from=python-deps /usr/bin/scp /usr/bin/scp
COPY --from=python-deps /usr/bin/sftp /usr/bin/sftp
COPY --from=python-deps /usr/lib/x86_64-linux-gnu/libedit.so.* /usr/lib/x86_64-linux-gnu/
COPY --from=python-deps /usr/lib/x86_64-linux-gnu/libbsd.so.* /usr/lib/x86_64-linux-gnu/
COPY --from=python-deps /usr/lib/x86_64-linux-gnu/libmd.so.* /usr/lib/x86_64-linux-gnu/
COPY --from=python-deps /usr/bin/ssh-add /usr/bin/ssh-add
COPY --from=python-deps /usr/bin/ssh-agent /usr/bin/ssh-agent
COPY --from=python-deps /.venv /.venv
ENV PATH="/.venv/bin:$PATH"
RUN useradd --create-home concourse
RUN mkdir -p /home/concourse/.ansible/cp \
    && mkdir -p /home/concourse/.ansible/tmp \
    && chown -R concourse:concourse /home/concourse/.ansible
WORKDIR /home/concourse
USER concourse
ENTRYPOINT ["/bin/bash"]
