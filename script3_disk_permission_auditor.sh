#!/bin/bash
# =============================================================
# Script 3: Disk and Permission Auditor
# Author: Aaditya Chougule | Roll: 24BCE10051
# Course: Open Source Software | VITyarthi
# Description: Loops through key system directories, reports
#              permissions and disk usage, then checks Firefox's
#              specific installation and profile directories.
# =============================================================

DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

echo "============================================================"
echo "         DISK AND PERMISSION AUDITOR — SYSTEM REPORT       "
echo "============================================================"
printf "%-25s %-22s %-10s\n" "Directory" "Perms (Owner:Group)" "Size"
echo "------------------------------------------------------------"


for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
       
        PERMS=$(ls -ld "$DIR" | awk '{print $1}')
        OWNER=$(ls -ld "$DIR" | awk '{print $3}')
        GROUP=$(ls -ld "$DIR" | awk '{print $4}')

        
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)

        printf "%-25s %-22s %-10s\n" "$DIR" "$PERMS ($OWNER:$GROUP)" "$SIZE"
    else
        printf "%-25s %-22s\n" "$DIR" "[Does not exist]"
    fi
done

echo "------------------------------------------------------------"
echo ""

echo "  --- Firefox-Specific Installation Audit ---"
echo ""

FIREFOX_BIN=$(which firefox 2>/dev/null)
if [ -n "$FIREFOX_BIN" ]; then
    PERMS=$(ls -l "$FIREFOX_BIN" | awk '{print $1, $3, $4}')
    echo "  [✔] Firefox binary     : $FIREFOX_BIN"
    echo "      Permissions        : $PERMS"
else
    echo "  [!] Firefox binary not found in PATH."
fi

echo ""

for FF_DIR in /usr/lib/firefox /usr/lib64/firefox /opt/firefox; do
    if [ -d "$FF_DIR" ]; then
        SIZE=$(du -sh "$FF_DIR" 2>/dev/null | cut -f1)
        PERMS=$(ls -ld "$FF_DIR" | awk '{print $1, $3, $4}')
        echo "  [✔] Firefox install dir: $FF_DIR"
        echo "      Permissions        : $PERMS"
        echo "      Size               : $SIZE"
        break
    fi
done

echo ""

FF_PROFILE="$HOME/.mozilla/firefox"
if [ -d "$FF_PROFILE" ]; then
    SIZE=$(du -sh "$FF_PROFILE" 2>/dev/null | cut -f1)
    PERMS=$(ls -ld "$FF_PROFILE" | awk '{print $1, $3, $4}')
    echo "  [✔] Firefox profile dir: $FF_PROFILE"
    echo "      Permissions        : $PERMS"
    echo "      Size               : $SIZE"
    echo "      (This folder holds your bookmarks, history & settings)"
else
    echo "  [!] Firefox profile directory not found at $FF_PROFILE"
fi

echo ""
echo "============================================================"
