function blit-android {
  param (
    $ip = '192.168.1.82',
    $port = '5555',
    [switch]$fullscreen,
    [switch]$h,
    [switch]$help
  )

  if($h -or $help) {
    write-host 'Setup from scratch:'
    write-host '1.  `scoop install adb & scoop install scrcpy`'
    write-host '2.  Get android device IP address (Wi-Fi settings)'
    write-host '3.  Enable USB Debugging'
    write-host '4.  Connect via USB to PC'
    write-host '5.  `adb devices`'
    write-host '6.  `adb tcpip 5555`'
    write-host '7.  `adb connect <device_ip>:5555`'
    write-host '8.  `scrcpy [--fullscreen]`'

    write-host 'To revert to usb `adb usb`'

    return
  }

  $address = $ip + ':' + $port

  adb connect $address
  
  if($fullscreen) {
    scrcpy --fullscreen
  }
  else {
    scrcpy
  }
}