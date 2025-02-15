# Simple WordPress Docker Configuration

A minimal Docker configuration for WordPress, optimized for Coolify deployment.

## Features

- WordPress 6.4 with Apache
- MySQL 8.0
- Redis 7 for object caching
- Coolify and Traefik ready
- Minimal configuration for reliability

## Configuration

### WordPress
- Official WordPress image with Apache
- Automatic database connection
- Redis object caching integration
- Volume persistence for uploads

### MySQL
- MySQL 8.0
- Native password authentication
- Persistent data storage

### Redis
- 128MB memory limit
- LRU eviction policy
- Persistence enabled
- Optimized for WordPress caching

## Usage

1. Clone this repository
2. Deploy to Coolify
3. Access your WordPress site

## Development

Requirements:
- Docker
- Docker Compose
- Git

## Notes

- Port mapping handled by Traefik in Coolify
- Data persistence through Docker volumes
- Redis improves performance by caching database queries and objects