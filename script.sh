start="2025-12-28"
end="2026-06-25"

current=$start

while [ "$(date -d "$current" +%s)" -le "$(date -d "$end" +%s)" ]; do

  commits=$((RANDOM % 10 + 1))

  for ((i=1;i<=commits;i++))
  do
    hour=$((RANDOM % 24))
    minute=$((RANDOM % 60))
    second=$((RANDOM % 60))

    export GIT_AUTHOR_DATE="$current $hour:$minute:$second"
    export GIT_COMMITTER_DATE="$current $hour:$minute:$second"

    git commit --allow-empty -m "Re running server"
  done

  current=$(date -I -d "$current + 1 day")

done
