# Simple WordPress Docker Configuration

A minimal, high-performance Docker configuration for WordPress using PHP-FPM, MySQL, and Redis.

## Features

- PHP 8.2 with FPM for optimal performance
- MySQL 8.0 with tuned InnoDB settings
- Redis 7 for object caching
- Optimized for Coolify deployment
- Traefik-ready configuration

## Configuration Highlights

### PHP-FPM
- Dynamic process management
- 256MB memory limit
- 64MB upload limit
- Docker-optimized logging

### MySQL
- InnoDB buffer pool: 1GB
- Optimized log settings
- Native password authentication
- Automatic database initialization

### Redis
- 256MB memory limit
- LRU eviction policy
- AOF persistence
- RDB snapshots
- WordPress-tuned settings

## Usage

1. Clone this repository
2. Deploy to Coolify
3. Access your WordPress site

## Development

Local development requires:
- Docker
- Docker Compose
- Git

## Notes

- Port mapping is handled by Traefik in Coolify
- Data persistence through Docker volumes
- Automatic Redis integration with WordPress