# 使用するベースイメージを選択(IMAGE:TAG)
FROM ruby:2.5.3

# ENVにより環境変数APP_ROOTを設定
ENV APP_ROOT /usr/src/WaitQueueProject
# $APP_ROOTを作業ディレクトリにする
WORKDIR $APP_ROOT

RUN apt-get update && \
    curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt-get install -y nodejs \
                       mysql-client \
                       postgresql-client \
                       --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

COPY Gemfile $APP_ROOT
COPY Gemfile.lock $APP_ROOT

RUN \
  echo 'gem: --no-document' >> ~/.gemrc && \
  cp ~/.gemrc /etc/gemrc && \
  chmod uog+r /etc/gemrc && \
  bundle config --global build.nokogiri --use-system-libraries && \
  bundle config --global jobs 4 && \
  bundle install && \
  rm -rf ~/.gem

COPY . $APP_ROOT

EXPOSE 3000 1234 26162

# デバッグ時は1行目をコメントアウト、通常起動時は2行目をコメントアウト
CMD ["rails", "server", "-b", "0.0.0.0"]
#CMD ["bundle", "exec", "rdebug-ide", "--host", "0.0.0.0", "--port", "1234", "--dispatcher-port", "26162", "--", "bin/rails", "server", "-b", "0.0.0.0"]
