FROM ubuntu:20.04
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get -y install software-properties-common
RUN add-apt-repository ppa:git-core/ppa
RUN apt-get update
RUN apt-get -y install lilypond timidity lame pandoc python git bash make cpanminus imagemagick gcc wget musescore3 texlive-extra-utils
RUN cpanm install chordpro
RUN ln -s /usr/bin/musescore3 /usr/bin/musescore
WORKDIR /root
RUN wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.4/wkhtmltox-0.12.4_linux-generic-amd64.tar.xz
RUN tar xvf wkhtmltox-0.12.4_linux-generic-amd64.tar.xz
RUN sed -i 's#<policy domain="coder" rights="none" pattern="PDF" />#<policy domain="coder" rights="read|write" pattern="PDF" />#' /etc/ImageMagick-6/policy.xml
RUN mv wkhtmltox/bin/wkhtmltoimage /usr/bin/
