# the latest looker_sdk requires Python 3.8.2
# https://pypi.org/project/looker-sdk/
FROM python:3.8.2

# install looker_sdk
RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir looker_sdk

