#!/bin/bash
# Herdr tab-bar status entry: CPU and RAM usage (macOS).
# Herdr displays the last line of stdout, so all diagnostics must stay off stdout.

top_line=$(top -l 1 -n 0 2>/dev/null)

idle=$(printf '%s\n' "$top_line" | grep -oE '[0-9.]+% idle' | grep -oE '[0-9.]+')
[ -z "$idle" ] && exit 1
cpu=$(printf '%.0f' "$(echo "100 - $idle" | bc)")

used_str=$(printf '%s\n' "$top_line" | grep -oE '[0-9.]+[GM] used' | grep -oE '[0-9.]+[GM]')
[ -z "$used_str" ] && exit 1
used_val=${used_str%[GM]}
used_unit=${used_str: -1}
if [ "$used_unit" = "M" ]; then
  used_gb=$(echo "$used_val / 1024" | bc -l)
else
  used_gb=$used_val
fi

total_bytes=$(sysctl -n hw.memsize)
total_gb=$(echo "$total_bytes / 1073741824" | bc -l)
ram=$(printf '%.0f' "$(echo "$used_gb / $total_gb * 100" | bc -l)")

printf 'CPU %s%% \xe2\x80\xa2 RAM %s%%\n' "$cpu" "$ram"
