# Decisions Log

## Initial Decisions

### 1. Repository Structure
The directory structure was created exactly based on the provided instructions
to ensure clarity and compliance.

### 2. Separation of Concerns
- `apps/` will contain application-level code
- `infra/` will contain infrastructure-related files
- `docs/` is used for all documentation

### 3. No Extra Implementation
No additional files or logic were added beyond the instructions to avoid
unexplained decisions.


# Challenge 2 – Dockerization Decisions

## Base Image Selection
- A Maven-based image was used in the build stage to compile the Spring Boot application.
- A lightweight JRE-only image was selected for the runtime stage to minimize the final image size.

## Multi-Stage Build
- A multi-stage Docker build was implemented to clearly separate build-time and runtime dependencies.
- This approach reduces the final image size and removes unnecessary build tools from the runtime image.
## Security Considerations
- The application runs as a non-root user inside the container.
- No credentials or secrets are hardcoded in the Docker image.
- All configuration is provided via environment variables, making the image environment-agnostic and secure.

# Challenge 3 – Orchestration & Monitoring Decisions

## Service Orchestration
Docker Compose was used to orchestrate application and database services
for local and integration environments.

## Networking
A dedicated bridge network was defined to isolate services and allow
internal service discovery via container names.

## Database Persistence
A named volume was used for MySQL to ensure data persistence across restarts.

## Observability
Spring Boot Actuator was enabled to expose health and metrics endpoints
as a minimal observability solution.

## Resource Management
Basic CPU and memory limits were applied to demonstrate production awareness.


# Challenge 5 – Sanction Bypass Script

## Design Decisions
- Bash was selected for maximum compatibility in Linux environments
- DNS-based solution was prioritized for simplicity and lower risk
- Dry-run mode is enabled by default to prevent accidental system changes
- Root access is detected and handled gracefully

## Security & Responsibility
- No changes are applied without proper permissions
- Rollback instructions are clearly provided
- The script avoids hardcoded sensitive data

## Extensibility
- DNS services are defined separately for easy extension
- Custom DNS option allows flexibility without code changes






