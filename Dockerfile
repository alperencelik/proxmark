FROM ubuntu:latest

RUN apt-get update -y && apt-get install -y --no-install-recommends git ca-certificates build-essential pkg-config \
libreadline-dev gcc-arm-none-eabi libnewlib-dev qtbase5-dev libbz2-dev libbluetooth-dev libpython3-dev libssl-dev

COPY . .
WORKDIR proxmark3
RUN make clean && make -j && make install && adduser root dialout

ENV port=""

#RUN git clone https://github.com/RfidResearchGroup/proxmark3.git && cd proxmark3 && make clean && make -j && adduser root dialout && make install

CMD proxmark3 -p $port -c "hf 14a reader"

