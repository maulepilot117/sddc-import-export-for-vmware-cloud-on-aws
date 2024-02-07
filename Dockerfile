FROM python/alpine

WORKDIR /tmp/scripts

COPY requirements.txt ./
RUN apk update && apk add git \
    && python3 -m pip install --no-cache-dir --upgrade pip && \
    python3 -m pip install --no-cache-dir -r requirements.txt
RUN git clone --branch main https://github.com/vmware-samples/sddc-import-export-for-vmware-cloud-on-aws.git
# Example execution: 
# docker run --rm -it -v /tmp/json:/tmp/scripts/json -v /tmp/config_ini:/tmp/scripts/config_ini sddc-impexp
