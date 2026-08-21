#!/bin/bash
# Claude Code statusline: shows context window usage, 5-hour, and weekly (7-day) usage limit percentages.
# Color signals danger/warn only; normal (uncolored) text means the limit is fine.

input=$(cat)

ctx=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
five=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')
week=$(echo "$input" | jq -r '.rate_limits.seven_day.used_percentage // empty')

RED='\033[31m'
YELLOW='\033[33m'
RESET='\033[0m'

colorize() {
  local rounded
  rounded=$(printf '%.0f' "$1")
  if [ "$rounded" -ge 90 ]; then
    printf "${RED}%s%%${RESET}" "$rounded"
  elif [ "$rounded" -ge 70 ]; then
    printf "${YELLOW}%s%%${RESET}" "$rounded"
  else
    printf '%s%%' "$rounded"
  fi
}

out=""
plain_out=""
if [ -n "$ctx" ]; then
  out="ctx: $(colorize "$ctx")"
  plain_out="ctx: $(printf '%.0f' "$ctx")%"
fi
if [ -n "$five" ]; then
  if [ -n "$out" ]; then
    out="$out •"
    plain_out="$plain_out •"
  fi
  out="$out 5hr: $(colorize "$five")"
  plain_out="$plain_out 5hr: $(printf '%.0f' "$five")%"
fi
if [ -n "$week" ]; then
  if [ -n "$out" ]; then
    out="$out •"
    plain_out="$plain_out •"
  fi
  out="$out week: $(colorize "$week")"
  plain_out="$plain_out week: $(printf '%.0f' "$week")%"
fi

[ -z "$out" ] && exit 0

cols=$(tput cols 2>/dev/null)
[ -z "$cols" ] && cols=${COLUMNS:-80}

pad=$((cols - ${#plain_out}))
[ "$pad" -lt 0 ] && pad=0

printf '%*s' "$pad" ''
printf '%s' "$out"
