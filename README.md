# Super Simple RPI Fan Controller via GPIO

1. Take a look at the files in this repo, it's just good practice to ensure nothing nefarious is happening.
2. Edit `fan-controller.sh`, set the `maxTemp` and `fanGPIO` variables to the appropriate values for your needs.
3. Run `sudo ./install.sh`.
4. Reboot, or run `sudo /etc/init.d/fan-control.sh start`
