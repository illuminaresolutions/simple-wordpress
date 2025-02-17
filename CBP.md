# Coolify Best Practices

This document captures our learnings and best practices for deploying with Coolify.

## Docker Compose Configuration

### Volume Declarations
- Do not declare empty volume configurations at the end of docker-compose.yaml
- Coolify automatically handles volume creation and management
- Simply reference volumes in service configurations:
  ```yaml
  services:
    wordpress:
      volumes:
        - wordpress_data:/var/www/html  # Coolify creates and manages this
  ```

### Port Mapping
- Avoid explicit port mappings in docker-compose.yaml
- Coolify's Traefik integration handles port management automatically
- Let Traefik handle routing and load balancing
- Benefits:
  - Simpler configuration
  - Better security (no exposed ports)
  - Automatic SSL/TLS handling
  - Load balancing support

## Testing
- All testing is done directly in Coolify production environment
- No local testing required
- Monitor deployment logs for issues
- Use Coolify's built-in monitoring tools

## Future Learnings
(We'll add more best practices as we discover them)
