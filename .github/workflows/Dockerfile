FROM ubuntu:20.04
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get -y install software-properties-common
RUN apt-get -y install lilypond timidity lame pandoc python git bash make cpanminus imagemagick gcc wget
RUN cpanm install chordpro
WORKDIR /root
RUN wget https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox_0.12.6-1.focal_amd64.deb
RUN dpkg -i wkhtmltox_0.12.6-1.focal_amd64.deb
RUN sed -i 's#<policy domain="coder" rights="none" pattern="PDF" />#<policy domain="coder" rights="read|write" pattern="PDF" />#' /etc/ImageMagick-6/policy.xml
