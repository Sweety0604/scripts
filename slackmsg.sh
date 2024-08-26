#!/bin/bash
# Shell Script to check if the disk space utilization on local machine is more than 50%. It should send a message on Slack.

# Slack webhook URL
SLACK_WEBHOOK_URL="https://hooks.slack.com/services/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"

# Threshold for disk space usage percentage
THRESHOLD=10

# Command to get disk space utilization
DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}' | cut -d'%' -f1)

# Check if DISK_USAGE is a number
if ! [[ "$DISK_USAGE" =~ ^[0-9]+$ ]]; then
    echo "Error: Disk usage is not a number."
    exit 1
fi
echo $DISK_USAGE
echo $THRESHOLD

# Compare disk usage with threshold
if [ "$DISK_USAGE" -gt "$THRESHOLD" ]; then
    # Message to be sent to Slack
    MESSAGE=":warning: Disk space utilization on the local machine is above 50%. Current usage: $DISK_USAGE"

    # Send message to Slack
    curl -X POST -H 'Content-type: application/json' --data "{\"text\":\"$MESSAGE\"}" "$SLACK_WEBHOOK_URL"
fi
echo $MESSAGE
