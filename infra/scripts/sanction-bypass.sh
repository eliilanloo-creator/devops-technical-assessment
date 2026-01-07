#!/usr/bin/env bash


# Sanction Bypass Configurator


set -e

CONFIG_DIR="$(dirname "$0")"
BACKUP_FILE="/etc/resolv.conf.backup"
DRY_RUN=true

# --------- DNS CONFIGS ---------
declare -A DNS_SERVICES
DNS_SERVICES["shecan"]="178.22.122.100 185.51.200.2"
DNS_SERVICES["custom"]=""

# --------- FUNCTIONS ---------

check_root() {
  if [[ "$EUID" -ne 0 ]]; then
    echo "⚠️  Not running as root. Switching to dry-run mode."
    DRY_RUN=true
  fi
}

print_menu() {
  echo "Select a service:"
  echo "1) Shecan (DNS)"
  echo "2) Custom DNS"
  echo "3) Exit"
}

apply_dns() {
  local dns="$1"

  echo "Selected DNS: $dns"

  if $DRY_RUN; then
    echo "[DRY-RUN] Would update /etc/resolv.conf with:"
    for ip in $dns; do
      echo "nameserver $ip"
    done
  else
    echo "Backing up current resolv.conf..."
    cp /etc/resolv.conf "$BACKUP_FILE"

    echo "Applying DNS..."
    : > /etc/resolv.conf
    for ip in $dns; do
      echo "nameserver $ip" >> /etc/resolv.conf
    done

    echo "✅ DNS applied successfully."
  fi
}

rollback_info() {
  echo
  echo "🔄 Rollback Instructions:"
  echo "If a backup exists, restore it with:"
  echo "sudo cp /etc/resolv.conf.backup /etc/resolv.conf"
}

# --------- MAIN ---------

check_root
print_menu
read -rp "Enter choice: " choice

case $choice in
  1)
    apply_dns "${DNS_SERVICES[shecan]}"
    ;;
  2)
    read -rp "Enter DNS IPs (space-separated): " custom_dns
    apply_dns "$custom_dns"
    ;;
  3)
    exit 0
    ;;
  *)
    echo "Invalid choice"
    exit 1
    ;;
esac

rollback_info

