FROM registry.access.redhat.com/ubi8/ubi:8.1

USER root

COPY entry.sh /entry.sh

RUN chmod +x /entry.sh

#! 1002030000

RUN yum -y install sudo policycoreutils-python-utils; 
RUN groupadd --gid 1001 sas; \
  useradd -l --gid 0 --home-dir /home/osuser --create-home --uid 1010 osuser; \
  echo 'osuser ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers;

USER 1010 

CMD ["sh", "-c", "tail -f /dev/null"]
