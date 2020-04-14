FROM ubuntu:18.04
RUN apt-get update
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -y install lilypond timidity lame pandoc python git bash make cpanminus imagemagick gcc wget
RUN cpanm install chordpro
WORKDIR /root
RUN wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.4/wkhtmltox-0.12.4_linux-generic-amd64.tar.xz
RUN tar xvf wkhtmltox-0.12.4_linux-generic-amd64.tar.xz
RUN sed -i 's#<policy domain="coder" rights="none" pattern="PDF" />#<policy domain="coder" rights="read|write" pattern="PDF" />#' /etc/ImageMagick-6/policy.xml
RUN mv wkhtmltox/bin/wkhtmltoimage /usr/bin/
