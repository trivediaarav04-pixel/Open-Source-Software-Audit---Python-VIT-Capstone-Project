# OSS Audit — Python
### Open Source Software Capstone Project | VITyarthi

---

## Student Details

| Field | Details |
|---|---|
| **Name** | Aarav Trivedi |
| **Roll Number** | 24BAI10671 |
| **Repository** | `oss-audit-24BAI10671` |
| **Chosen Software** | Python |
| **License** | PSF (Python Software Foundation) License |
| **Course** | Open Source Software — Units 1–5 |

---

## Repository Structure

```
oss-audit-24BAI10671/
│
├── README.md                  # This file
├── script1_system_identity.sh # System Identity Report
├── script2_package_inspector.sh # FOSS Package Inspector
├── script3_disk_auditor.sh    # Disk and Permission Auditor
├── script4_log_analyzer.sh    # Log File Analyzer
└── script5_manifesto.sh       # Open Source Manifesto Generator
```

---

## Shell Scripts — Overview

### Script 1 — System Identity Report (`script1_system_identity.sh`)
Displays a welcome screen with key system information including:
- Linux distribution name and kernel version
- Logged-in username and home directory
- System uptime and current date/time
- License message for the OS

**Concepts used:** Variables, `echo`, command substitution (`$()`), output formatting.

---

### Script 2 — FOSS Package Inspector (`script2_package_inspector.sh`)
Checks whether Python is installed on the system, retrieves its version and license info, and uses a `case` statement to print a short philosophy note about the package.

**Concepts used:** `if-then-else`, `case` statement, `dpkg -l`, pipe with `grep`.

---

### Script 3 — Disk and Permission Auditor (`script3_disk_auditor.sh`)
Loops through a list of important system directories and reports:
- Disk space usage of each directory
- Owner and permissions of each directory
- Checks Python's config directory and prints its permissions

**Concepts used:** `for` loop, `du`, `ls -ld`, `awk`, `cut`.

---

### Script 4 — Log File Analyzer (`script4_log_analyzer.sh`)
Reads a log file line by line, counts how many lines contain a keyword (default: `error`), and prints a summary. Also prints the last 5 matching lines.

**Concepts used:** `while read` loop, `if-then`, counter variables, command-line arguments (`$1`, `$2`).

**Usage:**
```bash
./script4_log_analyzer.sh /var/log/syslog error
```

---

### Script 5 — Open Source Manifesto Generator (`script5_manifesto.sh`)
Interactively asks the user three questions and generates a personalised open source philosophy statement, saved to a `.txt` file.

**Concepts used:** `read` for user input, string concatenation, file writing with `>`, `date` command.

---

## How to Run the Scripts on Linux (WSL 2 — Ubuntu)

### Prerequisites
Make sure you have the following installed on your Ubuntu WSL 2 system:

```bash
sudo apt update
sudo apt install python3 -y
```

### Step 1 — Clone the Repository
```bash
git clone https://github.com/<your-username>/oss-audit-24BAI10671.git
cd oss-audit-24BAI10671
```

### Step 2 — Make All Scripts Executable
```bash
chmod +x script1_system_identity.sh
chmod +x script2_package_inspector.sh
chmod +x script3_disk_auditor.sh
chmod +x script4_log_analyzer.sh
chmod +x script5_manifesto.sh
```

### Step 3 — Run Each Script

```bash
# Script 1 — System Identity Report
./script1_system_identity.sh

# Script 2 — FOSS Package Inspector
./script2_package_inspector.sh

# Script 3 — Disk and Permission Auditor
./script3_disk_auditor.sh

# Script 4 — Log File Analyzer (provide a log file path and keyword)
./script4_log_analyzer.sh /var/log/syslog error

# Script 5 — Manifesto Generator (interactive)
./script5_manifesto.sh
```


