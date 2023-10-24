Works via telegraph. We transfer the Port_check.sh script to the /usr/local/bin/ directory and the second server file there, and grant permission to execute the script.
In the servers file we indicate the necessary ports for checking.
In Telegraf config add
```
[[inputs.execd]]
  command = ["/usr/local/bin/Port_check.sh"]
  interval = "600s"
  data_format = "influx"				
```

There will be a new availability_status metric in prometheus.
