# Elixir 1.3.2: https://hub.docker.com/_/elixir/
FROM elixir:1.6.1
ENV DEBIAN_FRONTEND=noninteractive

# Install NodeJS 6.x and the NPM
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y -q nodejs

# Install hex, rebar and Phoenix
RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez --force

# Install deps
RUN mkdir /app
ADD src/mix.exs /app
ADD src/mix.lock /app
RUN cd /app && mix deps.get

# Install nodejs/npm stuff
RUN mkdir /app/assets
ADD src/assets/package.json /app/assets
ADD src/assets/package-lock.json /app/assets
RUN cd /app/assets && npm install

# Now copy all the source
ADD src /app

# Build assets
WORKDIR /app
ENV PORT 8080
ENV MIX_ENV prod
RUN cd assets && npm run deploy
RUN mix phx.digest

# Rock'n'roll
ENV PORT 8080
CMD ["mix", "phx.server"]
