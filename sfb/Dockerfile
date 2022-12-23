FROM registry.access.redhat.com/ubi8/ubi:8.0

ARG MQ_URL=https://public.dhe.ibm.com/ibmdl/export/pub/software/websphere/messaging/mqadv/mqadv_dev931_linux_x86-64.tar.gz

# RUN export DIR_EXTRACT=/tmp/mq \
#  && mkdir -p ${DIR_EXTRACT} \
#  && cd ${DIR_EXTRACT} \
#  && curl -kLO $MQ_URL \
#  && tar -xvf ./*.tar.gz

ADD ibm_MQ9.3.tar.gz /tmp/

RUN groupadd -g 1001 mqm
RUN useradd -u 1001 -g mqm mqm

# Install MQ
RUN cd /tmp/MQServer \
  && ./mqlicense.sh -accept -text_only \
  && rpm -ivh MQSeriesRuntime-*.rpm \
  && rpm -ivh MQSeriesJava-*.rpm \
  && rpm -ivh MQSeriesJRE-*.rpm \
  && rpm -ivh MQSeriesSFBridge-*.rpm \
  && rm -rf /tmp/MQServer \
  && rm -rf /var/mqm \
  && mkdir -p /var/mqm/ssl \
  && mkdir -p /var/mqm/sfb \
  && mkdir -p /var/mqm/log \
  && chown -R mqm:mqm /var/mqm

USER 1001
CMD bash -c "while true; do echo test; sleep 5; done"
