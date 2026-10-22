# baikal-docker

Self-built Docker image for [Baïkal](https://sabre.io/baikal/) — a CalDAV/CardDAV server I use to sync calendars across my devices.

## Why

The `ckulka/baikal` Docker image hasn't been updated since November 2025 and ships PHP 8.1 (EOL). In October 2026, two critical unauthenticated RCE vulnerabilities were disclosed in PHP — **CVE-2026-109618** and **CVE-2026-109619** (aka "PHP2Shell"). PHP 8.1 will never get a patch. I built my own from the official `php:8.4-fpm-alpine` base.

## Stack

- **PHP 8.4** (fpm-alpine)
- **nginx** — reverse proxy to php-fpm
- **Baikal 0.13.0** — latest release

## Usage

```bash
docker compose up -d
```

Baikal admin: `http://localhost/admin/`

## Volumes

- `./config` → `/var/www/baikal/config`
- `./data` → `/var/www/baikal/Specific`
