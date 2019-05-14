# rinetd-alpine

## example

```yaml
version: '2'
services:
    rinetd:
#        image: xiaozhuai/rinetd-alpine:latest
        build: .
        environment:
            FORWARDING_RULES: >
                0.0.0.0     8080    github.com   80;
                0.0.0.0     8888    github.com   80;
        ports:
            - 8080:8080
            - 8888:8888
```

each rule must ends with `;`

## forwarding rules

```yaml
# bindadress  bindport  connectaddress  connectport  options...
0.0.0.0     80        192.168.1.2     80
127.0.0.1   4000      127.0.0.1       3000
127.0.0.1   4000/udp  127.0.0.1       22           [timeout=1200]
127.0.0.1   8000/udp  192.168.1.2     8000/udp     [src=192.168.1.2,timeout=1200]
```
