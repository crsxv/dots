ssd () {
  echo "Device         Total  Used  Free  Pct MntPoint"
  df -h | grep "/dev/sd"
  df -h | grep "/mnt/"
}

