FROM erlang:18

MAINTAINER everydayhero <edh-dev@everydayhero.com>

ENV LANG C.UTF-8
ENV ELIXIR_VERSION 1.2.0

RUN set -xe \
        && ELIXIR_DOWNLOAD_SHA1=af84c8b65dbfd7a46be1ba7567569dcb6c588d8c \
        && curl -fSL -o elixir.tar.gz "https://github.com/elixir-lang/elixir/archive/v$ELIXIR_VERSION.tar.gz" \
        && echo "$ELIXIR_DOWNLOAD_SHA1 elixir.tar.gz" | sha1sum -c - \
        && mkdir -p /usr/src/elixir \
        && tar -xzf elixir.tar.gz -C /usr/src/elixir --strip-components=1 \
        && rm elixir.tar.gz \
        && cd /usr/src/elixir \
        && make \
        && make install PREFIX=/usr/local \
        && rm -rf /usr/src/elixir

CMD ["elixir"]
