# IP ↔ Domain Lookup Tool

🔁 IP ↔ Domain Lookup Tool

A simple and lightweight Bash tool to convert:

🌐 Domain to IP (DNS A record)

🛰️ IP to Domain (Reverse DNS lookup)

📁 Supports single entries and batch processing from text files

✒️ Created by: Cristopher Carbantes
📦 Features
✅ Convert a single domain to IP
✅ Convert a single IP to domain
✅ Process a file of domains to get IPs
✅ Process a file of IPs to get domains
✅ Displays a custom banner on run
✅ Minimal dependencies (dig, bash)

🛠️ Installation
```
git clone https://github.com/yourusername/ip-domain-tool.git
cd ip-domain-tool
chmod +x ip_domain_tool.sh
```
🚀 Usage
```
./ip_domain_tool.sh [option] [target]
🔹 Options:
Option	Description	Example
-d	Convert single domain to IP	./ip_domain_tool.sh -d google.com
-i	Convert single IP to domain	./ip_domain_tool.sh -i 8.8.8.8
-df	File of domains to IPs	./ip_domain_tool.sh -df domains.txt
-if	File of IPs to domains	./ip_domain_tool.sh -if ips.txt
```

📂 Input File Format
Simple plaintext files with one domain or IP per line.

Example domains.txt:

```
google.com
github.com
example.org
```

Example ips.txt:
```
8.8.8.8
93.184.216.34
1.1.1.1
```
📦 Example Output
```
===========================================
  IP ↔ Domain Lookup Tool
  Created by: Cristopher Carbantes
===========================================

✅ google.com → 142.250.191.14
✅ github.com → 20.207.73.82
❌ example.org → Could not resolve IP
```

⚠️ Requirements
-bash (usually pre-installed)

-dig (from dnsutils package)

To install dig if it's missing:
```
# Debian/Ubuntu
sudo apt install dnsutils

# CentOS/Fedora
sudo yum install bind-utils

# Arch
sudo pacman -S bind
```

📜 License
MIT License — free to use, modify, and distribute.

🙌 Contributing
Feel free to fork the repo and submit pull requests. Ideas like CSV/JSON output, parallel processing, or GUI wrappers are welcome!
