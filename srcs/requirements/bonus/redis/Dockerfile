FROM debian:buster

# Update System and Install Tools
RUN apt-get update && apt-get upgrade -y && \
	apt-get install redis -y

COPY	./tools/run.sh /
RUN		chmod +x /run.sh

ENTRYPOINT [ "./run.sh" ]