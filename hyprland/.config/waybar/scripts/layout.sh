#!/bin/bash
#!/bin/bash
hyprctl devices -j | jq -r '.keyboards[0].active_layout' | cut -c 1-3

