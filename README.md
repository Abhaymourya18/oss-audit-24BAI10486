# OSS Audit — Git
### Open Source Software Capstone Project
**Course:** Open Source Software (NGMC)
**Student:** Abhay Mourya | **Roll No:** 24BAI10486
**Chosen Software:** Git (GPL v2)

---

## About This Project

This repository contains five shell scripts written as part of the Open Source Audit capstone project. Each script demonstrates practical Linux and shell scripting skills while exploring the open-source philosophy behind **Git** — the world's most widely used version control system, created by Linus Torvalds in 2005.

---

## Repository Structure

```
oss-audit-[rollnumber]/
├── script1_system_identity.sh      # System welcome screen with OS/license info
├── script2_package_inspector.sh    # Checks if Git is installed + philosophy note
├── script3_disk_auditor.sh         # Audits system directory permissions and sizes
├── script4_log_analyzer.sh         # Scans log files for keywords and reports matches
├── script5_manifesto_generator.sh  # Generates a personalised open-source manifesto
└── README.md
```

---

## Scripts Overview

### Script 1 — System Identity Report
Displays a welcome screen showing the Linux distribution, kernel version, logged-in user, home directory, uptime, date/time, and the open-source license covering the OS.

**Concepts used:** Variables, `echo`, command substitution `$()`, `case` statement, basic output formatting.

### Script 2 — FOSS Package Inspector
Checks whether Git is installed on the system, retrieves its version and package details (via `rpm` or `dpkg`), and prints a philosophy note about Git and other FOSS packages using a `case` statement.

**Concepts used:** `if-then-else`, `case` statement, `rpm -qi` / `dpkg -l`, pipes with `grep`, `command -v`.

### Script 3 — Disk and Permission Auditor
Loops through a list of important Linux system directories and reports each one's size, owner, and permissions. Also checks Git-specific paths and the user's `.gitconfig` file.

**Concepts used:** `for` loop, arrays, `ls -ld`, `du -sh`, `awk`, `cut`, `while read`.

### Script 4 — Log File Analyzer
Reads a log file line by line, counts lines containing a keyword (default: `error`), and prints a summary with the last 5 matching lines. Includes retry logic if the file is empty.

**Concepts used:** `while read` loop, `if-then`, counter variables, `$1`/`$2` arguments, `tail`, `grep`, `mktemp`.

### Script 5 — Open Source Manifesto Generator
Interactively asks the user three questions and generates a personalised open-source philosophy statement, saving it to a `.txt` file named after the current user.

**Concepts used:** `read` for user input, string concatenation, writing to file with `>` and `>>`, `date`, input validation with `while`, alias demonstration.

---

## How to Run the Scripts

### Prerequisites
- A Linux system (Ubuntu, Fedora, Debian, Arch, or any major distro)
- Bash shell (pre-installed on all Linux systems)
- Git installed (for Script 2 to show full details): `sudo apt install git` or `sudo dnf install git`

### Step 1 — Clone the Repository
```bash
git clone https://github.com/[your-username]/oss-audit-[rollnumber].git
cd oss-audit-[rollnumber]
```

### Step 2 — Make Scripts Executable
```bash
chmod +x script1_system_identity.sh
chmod +x script2_package_inspector.sh
chmod +x script3_disk_auditor.sh
chmod +x script4_log_analyzer.sh
chmod +x script5_manifesto_generator.sh
```

### Step 3 — Run Each Script

**Script 1 — System Identity Report:**
```bash
./script1_system_identity.sh
```

**Script 2 — FOSS Package Inspector:**
```bash
./script2_package_inspector.sh
```

**Script 3 — Disk and Permission Auditor:**
```bash
./script3_disk_auditor.sh
```

**Script 4 — Log File Analyzer:**
```bash
# Ubuntu/Debian:
./script4_log_analyzer.sh /var/log/syslog error

# Fedora/RHEL:
./script4_log_analyzer.sh /var/log/messages error

# Custom keyword:
./script4_log_analyzer.sh /var/log/syslog warning
```

**Script 5 — Open Source Manifesto Generator:**
```bash
./script5_manifesto_generator.sh
# Follow the interactive prompts
```

---

## Dependencies

| Script | Dependencies |
|--------|-------------|
| Script 1 | `uname`, `whoami`, `uptime`, `date`, `cat` — all pre-installed |
| Script 2 | `git`, `rpm` or `dpkg` (depending on distro) |
| Script 3 | `ls`, `du`, `awk`, `cut` — all pre-installed |
| Script 4 | `grep`, `tail`, `mktemp` — all pre-installed |
| Script 5 | `date`, `whoami`, `cat` — all pre-installed |

All core dependencies are standard Linux utilities available on any major distribution.

---

## License

This project is submitted as academic coursework under VIT's Open Source Software course. The shell scripts are original work by the student.

Git (the audited software) is licensed under the **GNU General Public License v2 (GPL v2)**.
