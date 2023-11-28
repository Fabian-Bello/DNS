FROM ubuntu:latest

# Install BIND9
RUN apt-get update && apt-get install -y bind9 bind9utils bind9-doc

# Copy BIND configuration files
COPY named.conf /etc/bind/
COPY named.conf.local /etc/bind/
COPY named.conf.options /etc/bind/
COPY db.google.de /etc/bind/

# Expose DNS port
EXPOSE 53/udp 53/tcp

# Run BIND
CMD ["named", "-g"]
