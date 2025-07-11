#!/bin/bash

# ---------------------------
# Banner
# ---------------------------
show_banner() {
    echo "==========================================="
    echo "  IP ↔ Domain Lookup Tool"
    echo "  Created by: Cristopher Carbantes"
    echo "==========================================="
    echo
}

# ---------------------------
# Convert domain to IP
# ---------------------------
domain_to_ip() {
    domain=$1
    ip=$(dig +short "$domain" | grep -Eo '([0-9]{1,3}\.){3}[0-9]{1,3}' | head -n 1)
    if [[ -n "$ip" ]]; then
        echo "✅ $domain → $ip"
    else
        echo "❌ $domain → Could not resolve IP"
    fi
}

# ---------------------------
# Convert IP to domain
# ---------------------------
ip_to_domain() {
    ip=$1
    domain=$(dig -x "$ip" +short)
    if [[ -n "$domain" ]]; then
        echo "✅ $ip → $domain"
    else
        echo "❌ $ip → Could not resolve domain"
    fi
}

# ---------------------------
# Process file of domains
# ---------------------------
file_domains() {
    while IFS= read -r domain; do
        [[ -n "$domain" ]] && domain_to_ip "$domain"
    done < "$1"
}

# ---------------------------
# Process file of IPs
# ---------------------------
file_ips() {
    while IFS= read -r ip; do
        [[ -n "$ip" ]] && ip_to_domain "$ip"
    done < "$1"
}

# ---------------------------
# Help message
# ---------------------------
show_help() {
    echo "Usage:"
    echo "  $0 -d <domain>     # Single domain to IP"
    echo "  $0 -i <ip>         # Single IP to domain"
    echo "  $0 -df <file>      # File of domains to IP"
    echo "  $0 -if <file>      # File of IPs to domain"
    exit 1
}

# ---------------------------
# Main logic
# ---------------------------
show_banner

if [[ $# -ne 2 ]]; then
    show_help
fi

case "$1" in
    -d) domain_to_ip "$2" ;;
    -i) ip_to_domain "$2" ;;
    -df) [[ -f "$2" ]] && file_domains "$2" || echo "❌ File not found: $2" ;;
    -if) [[ -f "$2" ]] && file_ips "$2" || echo "❌ File not found: $2" ;;
    *) show_help ;;
esac
