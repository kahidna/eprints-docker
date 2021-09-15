FROM mysql:5.7

ENV EPRINTSV=3.3.16

ENV DEBIAN_FRONTEND=noninteractive

COPY eprints-docker-entrypoint.sh /

RUN apt update && apt install wget curl apache2 -y

RUN apt install -y perl libncurses5 libselinux1 libsepol1 apache2 libapache2-mod-perl2 libxml-libxml-perl   libunicode-string-perl libterm-readkey-perl libmime-lite-perl libmime-types-perl libdigest-sha-perl   libdbd-mysql-perl libxml-parser-perl libxml2-dev libxml-twig-perl libarchive-any-perl libjson-perl   liblwp-protocol-https-perl libtext-unidecode-perl lynx wget ghostscript antiword elinks texlive-base   texlive-base-bin psutils imagemagick adduser tar gzip  unzip   libsearch-xapian-perl libtex-encode-perl libio-string-perl vim git build-essential libcgi-pm-perl gnupg sendmail lsb-release 

RUN adduser \
    --disabled-password \
    --gecos "" \
    --home "/opt/eprints" \
    --shell "/bin/bash" \
    --no-create-home && \
chmod +x /eprints-docker-entrypoint.sh 

EXPOSE 80 443

CMD ['/eprints-docker-entrypoint.sh']
