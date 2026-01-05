DevOps Technical Assessment – Food Bot
Project Overview

This repository contains a DevOps technical assessment focused
on containerization,orchestration, security, and operational
readiness of a Spring Boot application.
The assessment is structured into multiple challenges,
each demonstrating a specific set of DevOps skills
with clear documentation and reproducible setups.

Covered Challenges

1.Project Structure & Documentation
- Clean and well-organized Git repository structure
- Clear and concise README.md
- Decision tracking and architectural documentation
  
2.Dockerization of Spring Boot
- Multi-stage Docker build
- Optimized runtime image
- Application runs as a non-root user
- Ready for container-based deployment
3.Docker Compose + MySQL + Monitoring
- Orchestrated services using docker-compose
- MySQL database with persistent volume
- Dedicated Docker network for service isolation
- Basic observability support (via application endpoints)
4.Optimization & Security
- Identification of key production risks
- Non-root container execution
- Recommendations for secret management
- Suggested improvements for production readiness
5.Sanction Bypass Script
- Interactive CLI script for DNS/proxy configuration simulation
- Supports service selection via menu
- Clear rollback instructions

Goal
The goal of this assessment is to demonstrate practical DevOps skills, including:
- Containerization and image optimization
- Service orchestration and networking
- Observability and monitoring concepts
- Security best practices
- Automation and scripting
- Clear documentation and decision transparency 
- All components are designed to be easy to understand, reproducible,
  and suitable for real-world DevOps workflows.

Usage Notes
Before running the sanction bypass script, make it executable:

chmod +x infra/scripts/sanction-bypass.sh

