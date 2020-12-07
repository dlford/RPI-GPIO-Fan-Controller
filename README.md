# Super Simple RPI Fan Controller via GPIO

1. Take a look at the files in this repo, it's just good practice to ensure nothing nefarious is happening.
2. Edit `fan-controller.sh`, set the `maxTemp` and `fanGPIO` variables to the appropriate values for your needs.
3. Run `sudo ./install.sh`.
4. Reboot, or run `sudo /etc/init.d/fan-control.sh start`

You should be able to see log entries in `syslog` like the ones below:

`tail -f /var/log/syslog`

```txt
Dec  7 07:00:44 octopi systemd[1]: Starting fan-control.service...
Dec  7 07:00:44 octopi fan-control.sh[17146]: Starting fan-controller.sh
Dec  7 07:00:44 octopi systemd[1]: Started fan-control.service.
Dec  7 07:04:30 octopi fan-control.sh[17146]: Temperature: 65; Fan started
Dec  7 07:05:30 octopi fan-control.sh[17146]: Temperature: 60; Fan stopped
```
