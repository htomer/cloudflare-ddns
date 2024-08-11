# Cloudflare DDNS Docker Updater  
[![Docker](https://github.com/htomer/cloudflare-ddns/actions/workflows/docker-publish.yml/badge.svg?event=release)](https://github.com/htomer/cloudflare-ddns/actions/workflows/docker-publish.yml)
![GitHub Release](https://img.shields.io/github/v/release/htomer/cloudflare-ddns)


This Docker container is designed to automate the process of updating the IP address associated with a Dynamic DNS (DDNS) record on Cloudflare. The container uses a bash script that periodically retrieves the current public IP address and updates the corresponding DNS record on Cloudflare's DNS service. By encapsulating this functionality within a Docker container, it offers improved portability and ease of deployment across different environments.

## Build 

To build the container yourself simply run:

```bash
docker build .
```

## Parameters

#### Required

- EMAIL - Your Cloudflare account email address.
- METHOD - Set to "global" for Global API Key or "token" for Scoped API Token.
- KEY - Your API Token or Global API Key
- ZONE - Zone identifier can be found in the "Overview" tab of your domain.
- RECORD - Which record you want to be synced.

#### Optional

- PROXY - Set to "true" to make traffic go through Cloudflare. Defaults to false.

## Usage

To run the cloudflare ddns updater container:

```bash
docker run \
  -d \
  -e EMAIL="example@example.com" \
  -e METHOD="global" \
  -e KEY="xxxxxxxxxx" \
  -e ZONE="xxxxxxxxxx" \
  -e RECORD="test.example.com" \
  ghcr.io/htomer/cloudflare-ddns
```

## Reference

This project is based on the [cloudflare-ddns-updater](https://github.com/K0p1-Git/cloudflare-ddns-updater) script created by [Jason K](https://github.com/K0p1-Git).

## License

[MIT](https://github.com/htomer/cloudflare-ddns/blob/main/LICENSE)