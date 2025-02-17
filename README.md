# Simple WordPress Docker Configuration

A minimal Docker configuration for WordPress, optimized for Coolify deployment.

## Planned Features

- WordPress (latest) with PHP 8.2, PHP-FPM, and Nginx
- MySQL LTS
- Redis 7 for object caching
- WP-CLI
- Coolify and Traefik ready (= minimal port and network configuration)
- Minimal configuration for reliability

## Configuration

### WordPress
- Official WordPress image with PHP 8.2, PHP-FPM, and Nginx
- Automatic database connection
- Redis object caching integration
- Volume persistence for uploads

### MySQL
- MySQL LTS (8.4.4)
- Simplest authentication
- Persistent data storage

### Redis
- 128MB memory limit
- LRU eviction policy
- Persistence enabled
- Optimized for WordPress caching

## Usage

1. Clone this repository
2. Deploy to Coolify
3. Access your WordPress site for the famous five-minute install

## Development

Requirements:
- Docker
- Docker Compose
- Git
- Coolify

## Notes

- Port mapping handled by Traefik in Coolify
- Data persistence through Docker volumes
- Redis improves performance by caching database queries and objects