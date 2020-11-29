FROM ubuntu:18.04
RUN apt-get update
RUN apt-get -y install nodejs npm
RUN apt-get -y install curl dnsutils fortune fortunes fortunes-bofh-excuses jq netcat whois
RUN useradd -m hubot -c "Hu Bot" -s /bin/bash
WORKDIR /home/hubot
ADD . /home/hubot
RUN chown -R hubot.hubot /home/hubot
USER hubot
CMD ./bin/hubot --adapter slack
