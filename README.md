# Bulk FFUF Fuzzer

A simple Bash script to fuzz multiple websites using [ffuf](https://github.com/ffuf/ffuf). It reads a list of target URLs from a file, fuzzes them using a specified wordlist, and saves the results in separate HTML reports for each site.

---

## What It Does

- Performs directory or endpoint fuzzing across **multiple domains**
- Filters common noise responses (`400`, `404`, `429`)
- Recursively fuzzes up to a specified depth
- Saves output in **HTML format**, one report per domain
- Stores results neatly in a `ffuf_results/` directory

---

## Files Included

- `bulk_ffuf.sh`: The main Bash script
- `README.md`: You're reading it
- `LICENSE`: MIT License

---

## Requirements

- Bash (Linux/macOS or WSL)
- [`ffuf`](https://github.com/ffuf/ffuf) installed and in your `$PATH`
- A wordlist file (e.g., from SecLists, `rockyou.txt`, etc.)

---

## Installation

1. Clone this repository or download the script:

   ```bash
   git clone https://github.com/0xrasel/bulk_ffuf.git
   cd bulk_ffuf
   chmod +x bulk_ffuf.sh

## Usage
`./bulk_ffuf.sh sites.txt ~/wordlist/hfuzz.txt`

## Output
```
ffuf_results/
├── example.com.html
├── testsite.local.html
└── demo.example.org.html
```
