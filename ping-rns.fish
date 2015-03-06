#!/usr/local/bin/fish

set room $argv[1]
set machine_count $argv[2]

printf "{"
for machine in (seq 1 $machine_count)
  printf "\"$machine\":"
  ping -o -q -t 1 rns$room-$machine.cs.stolaf.edu ^/dev/null >/dev/null
  if test $status -eq 0
    printf "true"
  else
    printf "false"
  end
  if test $machine -lt $machine_count
    # because json is invalid with trailing commas
    printf ","
  end
end

printf "}"
