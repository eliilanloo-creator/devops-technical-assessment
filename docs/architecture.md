# Architecture & Production Readiness

## Current Architecture
Users → food_bot (Spring Boot) → MySQL → Monitoring (Actuator)

## Actions Taken
- Dockerized with multi-stage build
- Non-root user for container
- Persistent volume for MySQL
- Dedicated Docker network
- Actuator healthcheck enabled
- Resource limits (CPU/Memory) applied

## Recommended Improvements
- Manage secrets with environment variables or Vault
- Centralized logging (ELK / Grafana)
- Advanced monitoring (Prometheus + Grafana)
- HTTPS / SSL / Firewall
- Database backup strategy
- Vulnerability scanning (Trivy / Anchore)
- Consider auto-scaling if load increases

## Identified Risks
1. Hardcoded credentials
2. No database backup
3. Resource exhaustion

