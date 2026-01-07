Architecture & Production Readiness

Current Architecture
Users → food_bot (Spring Boot) → MySQL
- The application is containerized using Docker and orchestrated with Docker Compose.
A MySQL database runs as a separate container with persistent storage.

Actions Taken
- Application containerized using a multi-stage Docker build
- Optimized Java runtime using a lightweight JRE image
- Application runs as a non-root user inside the container
- Docker Compose used to orchestrate application and database services
- Persistent volume configured for MySQL data
- Dedicated Docker network for service isolation
- Spring Boot Actuator enabled for basic health visibility

Recommended Improvements
- Introduce proper secret management using environment variables, Docker secrets, or Vault
- Add centralized logging (e.g. ELK stack or Grafana Loki)
- Integrate metrics collection and visualization (Prometheus + Grafana)
- Configure HTTPS, SSL certificates, and basic firewall rules
- Implement database backup and restore strategy
- Add container and dependency vulnerability scanning (e.g. Trivy)
- Define resource limits and requests for CPU and memory
- Consider horizontal scaling or container orchestration platforms (e.g. Kubernetes) if load increases

Identified Risks

1.Secrets or credentials may be exposed if not managed securely

2.Risk of data loss due to missing automated database backups

3.Limited observability without centralized logging and metrics


