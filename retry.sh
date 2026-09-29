# add to .bashrc or use source and check with command -v retry to see if sourced
# REF https://gist.github.com/sj26/88e1c6584397bb7c13bd11108a579746

function retry {
  local retries=$1
  shift # shift by 1 (default): remove first argument

  local count=0
  # `$@ ` gets all positional arguments. Using double quotes treats each separately
  # `until` stops at the last positional argument (the command)
  until "$@"; do
  # `$?` is the exit status of the last executed command (passed as argument)
    exit=$?
    wait=$((2 ** $count))
    count=$(($count + 1))
    if [ $count -lt $retries ]; then
      echo "Retry $count/$retries exited $exit, retrying in $wait seconds..."
      sleep $wait
    else
      echo "Retry $count/$retries exited $exit, no more retries left."
      return $exit
    fi
  done
  return 0
}