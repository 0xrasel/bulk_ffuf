#!/bin/bash

# Check for correct number of arguments
if [[ $# -ne 2 ]]; then
    echo "Usage: $0 <live_domain_list> <wordlist_file>"
    echo "Example: $0 domain_live.txt ~/wordlist/hfuzz.txt"
    exit 1
fi

WORDLIST=$2

OUTFORMAT=html

SITES_FILE=$1

MATCH_CODES="all"

FILTER_CODES="400,404,429"

OUTPUT_DIR="./ffuf_results"
mkdir -p "$OUTPUT_DIR"

# Read each site from the list
while IFS= read -r SITE; do
    # Skip empty lines or lines starting with #
    [[ -z "$SITE" || "$SITE" =~ ^# ]] && continue

    # Remove trailing slash for consistency
    CLEAN_SITE=$(echo "$SITE" | sed 's#/$##')

    # Extract domain name for output file (strip https:// or http:// and slashes)
    DOMAIN_NAME=$(echo "$CLEAN_SITE" | sed 's~https\?://~~; s~/~~g')

    TARGET_URL="${CLEAN_SITE}/FUZZ"

    OUTPUT_FILE="${OUTPUT_DIR}/${DOMAIN_NAME}.${OUTFORMAT}"

    echo "[*] Fuzzing $TARGET_URL -> $OUTPUT_FILE"

    ffuf -u "$TARGET_URL" \
         -mc "$MATCH_CODES" \
         -fc "$FILTER_CODES" \
         -c \
         -w "$WORDLIST" \
         -of "$OUTFORMAT" \
         -c \
         -sf \
         -o "$OUTPUT_FILE"

    echo "[+] Finished $DOMAIN_NAME"
    echo "------------------------------------"

done < "$SITES_FILE"
