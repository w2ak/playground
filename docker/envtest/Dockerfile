FROM busybox:latest

WORKDIR /root
COPY vars.sh .

ENV FOO="bar"

ENTRYPOINT ["/bin/ash"]
CMD ["vars.sh"]
