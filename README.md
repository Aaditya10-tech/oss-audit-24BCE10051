# OSS Audit — 24BCE10051

> **Open Source Software Audit** | VITyarthi | OSS NGMC Course

---

## Student Information

| Field | Details |
|---|---|
| **Name** | Aaditya Chougule |
| **Roll Number** | 24BCE10051 |
| **Slot** | F11 |
| **Date of Submission** | 31/03/26 |

---

## Chosen Software

**[Software Name]** — [One-line description of what it does]

> Example: **Git** — A distributed version control system licensed under GPL v2, originally created by Linus Torvalds in 2005.

---

## Repository Structure
```
oss-audit-[rollnumber]/
├── README.md
├── script1_system_identity.sh
├── script2_package_inspector.sh
├── script3_disk_permission_auditor.sh
├── script4_log_analyzer.sh
└── script5_manifesto_generator.sh
```

---

## Scripts Overview

### Script 1 — System Identity Overview
**File:** `script1_system_identity.sh`  
**Description:** Presents a welcome dashboard displaying key system details such as the Linux distribution name, kernel version, current user, home directory, system uptime, current date/time, and the OS license information.  
**Concepts Used:** Variables, `echo`, command substitution (`$()`), formatted output.

---

### Script 2 — FOSS Package Checker
**File:** `script2_package_inspector.sh`  
**Description:** Verifies if a specified software package is installed, fetches its version and related details, and uses a `case` statement to display a brief conceptual description of its role.  
**Concepts Used:** `if-then-else`, `case` statement, `rpm -qi` / `dpkg -l`, piping with `grep`.

---

### Script 3 — Disk & Permission Scanner
**File:** `script3_disk_permission_auditor.sh`  
**Description:** Iterates through essential system directories (`/etc`, `/var/log`, `/home`, `/usr/bin`, `/tmp`) to report disk usage and ownership/permission details. It also checks for the existence of a configuration directory for a selected software.  
**Concepts Used:** `for` loop, `df`, `ls -ld`, `awk`, `cut`.

---

### Script 4 — Log Analyzer Tool
**File:** `script4_log_analyzer.sh`  
**Description:** Processes a log file line by line, counts how many times a given keyword (default: `error`) appears, and outputs a summary. Accepts the log file path and keyword as command-line inputs.  
**Concepts Used:** `while read` loop, `if-then`, counter variables, command-line arguments (`$1`, `$2`).

---

### Script 5 — Open Source Statement Generator
**File:** `script5_manifesto_generator.sh`  
**Description:** Prompts the user with three interactive questions and generates a customized open-source philosophy statement, saving it to a `.txt` file named after the current user.  
**Concepts Used:** `read` for input, string concatenation, file output using `>` and `>>`, `date` command.
## How to Run the Scripts

### Prerequisites

- A Linux system (Ubuntu/Debian or RHEL/CentOS based)
- Bash shell (`bash --version` to verify)
- The chosen software package installed (for Script 2)

### Step 1 — Clone the Repository
```bash
git clone https://github.com/[your-username]/oss-audit-[rollnumber].git
cd oss-audit-[rollnumber]
```

### Step 2 — Make All Scripts Executable
```bash
chmod +x *.sh
```

### Step 3 — Run Each Script

**Script 1 — System Identity Report**
```bash
./script1_system_identity.sh
```

**Script 2 — FOSS Package Inspector**
```bash
./script2_package_inspector.sh
```

**Script 3 — Disk and Permission Auditor**
```bash
./script3_disk_permission_auditor.sh
```

**Script 4 — Log File Analyzer**
```bash
# Basic usage (default keyword: 'error')
./script4_log_analyzer.sh /var/log/syslog

# With a custom keyword
./script4_log_analyzer.sh /var/log/syslog WARNING
```

**Script 5 — Open Source Manifesto Generator**
```bash
./script5_manifesto_generator.sh
# Follow the on-screen prompts to generate your manifesto
```

---

## Dependencies

| Script | Dependencies | Install Command |
|---|---|---|
| Script 1 | `uname`, `uptime`, `whoami` | Pre-installed on all Linux systems |
| Script 2 | `rpm` or `dpkg`, `grep` | Pre-installed on all Linux systems |
| Script 3 | `du`, `ls`, `awk`, `cut` | Pre-installed on all Linux systems |
| Script 4 | `grep`, `tail` | Pre-installed on all Linux systems |
| Script 5 | `date`, `cat` | Pre-installed on all Linux systems |

> All scripts are written in standard Bash and have no external dependencies beyond a base Linux installation.

---

## License

This project was submitted as part of the **Open Source Software (OSS NGMC)** course at VIT. All shell scripts and written content are original work by the student listed above.

---

*Submitted via the VITyarthi portal as part of The Open Source Audit Capstone Project.*
