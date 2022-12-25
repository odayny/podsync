FROM golang
ADD ./ /go/src/app
WORKDIR /go/src/app
RUN make

RUN wget -O /usr/bin/yt-dlp https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp
RUN chmod +x /usr/bin/yt-dlp
RUN ln -s /usr/bin/yt-dlp /usr/bin/youtube-dl
RUN apt-get update
RUN apt-get install -y --no-install-recommends ca-certificates python3 python3-pip ffmpeg tzdata

ENTRYPOINT ["/go/src/app/bin/podsync"]
# ENTRYPOINT ["/go/src/app/bin/podsync", "--no-banner", "--config /go/src/app/config.toml"]
# CMD ["--no-banner --config /go/src/app/config.toml"]
