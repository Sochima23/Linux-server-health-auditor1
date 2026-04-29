#  Linux Server Health Auditor

![DevOps](https://img.shields.io/badge/DevOps-Automation-blue)
![Bash](https://img.shields.io/badge/Bash-Scripting-black)
![Prometheus](https://img.shields.io/badge/Monitoring-Prometheus-orange)
![Docker](https://img.shields.io/badge/Container-Docker-blue)
![Status](https://img.shields.io/badge/Status-Active-brightgreen)

---

 ---

##  Project Overview

This project implements automated system health monitoring using a Bash script and cron scheduling.

It monitors:
- CPU usage
- Memory usage
- Disk usage

These metrics are evaluated against thresholds:

- OK
- WARNING
- CRITICAL

---

## Automation (Cron)

The script runs automatically every 5 minutes:

*/5 * * * * /bin/bash health_audit.sh

## System Architecture
                 ┌──────────────────────────┐
                 │      Cron Scheduler      │
                 │   (runs every 5 mins)    │
                 └──────────┬───────────────┘
                            │
                            ▼
                 ┌──────────────────────────┐
                 │  Bash Health Script      │
                 │ (CPU / MEM / DISK check) │
                 └──────────┬───────────────┘
                            │
          ┌──────────────────┴──────────────────┐
          │                                     │
          ▼                                     ▼
┌──────────────────────┐            ┌────────────────────────┐
│  JSON Health Report  │            │ Prometheus Metrics File │
│  (logs/health.log)   │            │  (metrics.prom)        │
└──────────────────────┘            └──────────┬─────────────┘
                                               │
                                               ▼
                              ┌──────────────────────────┐
                              │  Prometheus (Docker)     │
                              │  Scrapes metrics file    │
                              └──────────┬───────────────┘
                                         │
                                         ▼
                              ┌──────────────────────────┐
                              │ Monitoring Dashboard      │
                              │ http://localhost:9090    │
                              └──────────────────────────┘
## Key Features

 Automated monitoring using Cron
 Real-time system metrics collection
 Threshold-based alerting system (OK / WARNING / CRITICAL)
 JSON logging for audit trail
 Prometheus-compatible metrics export
 Docker-based monitoring deployment
 Fully local setup (no cloud dependency)

## How to Run the Project

1. Clone repository
git clone https://github.com/DevOps-Capstone-Project-Group-4/Linux-server-health-auditor.git

cd Linux-server-health-auditor/health-audit-files

3. Make script executable
chmod +x health_audit.sh

4. Run manually (test mode)
./health_audit.sh

You should see:

JSON output of system health

Prometheus metrics file generated

4. Enable automation (Cron job)
crontab -e

5. Start Prometheus (Docker)

docker run -d \
  --name prometheus \
  -p 9090:9090 \
  -v $HOME/metrics:/metrics \
  -v $PWD/prometheus.yml:/etc/prometheus/prometheus.yml \
  prom/prometheus

6. Open Prometheus Dashboard

Open in browser:

http://localhost:9090

## Query metrics:

cpu_usage
memory_usage
disk_usage

## Restart Guide (after reboot)
cd ~/Linux-server-health-auditor/health-audit-files
./health_audit.sh
docker start prometheus

## Prometheus Integration

The script exports metrics in Prometheus format:

cpu_usage 12
memory_usage 45
disk_usage 70

These are stored in:

metrics.prom

Prometheus scrapes this file at regular intervals.


## Status

✔ Fully functional
✔ Automated
✔ Containerised monitoring
✔ Capstone-ready submission
