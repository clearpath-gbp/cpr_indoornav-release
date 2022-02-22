cpr_indoornav_msgs
=====================

Differences between Melodic and OTTO 2.22 BatteryState messages:

```
diff /opt/clearpath/2.22/share/sensor_msgs/BatteryState.msg /opt/ros/melodic/share/sensor_msgs/msg/BatteryState.msg
0a1
>
35d35
< float32 temperature      # Temperature in Degrees Celsius (If unmeasured NaN)
48,49d47
< float32[] cell_temperature  # An array of individual cell temperatures for each cell in the pack
<                             # If individual temperatures unknown but number of cells known set each to NaN
```
