# How enable / disable USB Devices from S3 suspend

## grep if ID enable / disalbe

```shell
grep . /sys/bus/usb/devices/*/power/wakeup  
```

## USB devices infos

```shell
grep . /sys/bus/usb/devices/*/product  
```

## Edit STATE

```shell
sudo echo "disabled" > /sys/bus/usb/devices/1-2.2/power/wakeup
```

## Check STATE

```shell
cat /sys/bus/usb/devices/1-2.2/power/wakeup
```
